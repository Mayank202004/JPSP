import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jpss/routes/route_names.dart';

import '../core/network/token_service.dart';
import '../utils/helper.dart';

class AuthController extends GetxController{
  RxBool loading = false.obs;

  final box = GetStorage();
  final _dio = Dio();

  /*
  * @desc This function is used to register
  * @route POST /users/register
  */
  Future<void> register({required String email,required String username, required String name, required String password}) async {
    try {
      loading.value=true;
      final response = await _dio.post(
        "${dotenv.env['BACKEND_BASE_URL']}/users/register",
        data: {
          "fullName": name,
          "username": username,
          "email": email,
          "password": password,
        },
          options: Options(
            validateStatus: (status) {
              return true;
            },)
      );

      if (response.statusCode == 201) {
        final data = response.data['data'];

        final createdUser = data['createdUser'];
        final accessToken = data['accessToken'];
        final refreshToken = data['refreshToken'];

        // Save tokens locally
        TokenService.saveTokens(accessToken, refreshToken);

        // Save user details
        await saveUserDetails({
          "fullName": createdUser["fullName"],
          "username": createdUser["username"],
          "email": createdUser["email"],
          "id": createdUser["_id"]
        });

        showSnackBar("Success", response.data["message"] ?? "Registration successful");

        // Navigate to home
        Get.toNamed(RouteNames.homePage);
        Get.delete<AuthController>();
      } else {
        showSnackBar("Error", response.data["message"] ?? "Registration failed");
      }
    } on DioException catch (e) {
      print(e);
      final message = e.response?.data["message"] ?? "Something went wrong while registering";
      showSnackBar("Error", message);
    } catch (e) {
      print(e);
      showSnackBar("Error", "Unexpected error occurred");
    }
    finally{
      loading.value=false;
    }
  }

  /*
  * @desc This function is used to login user
  * @route POST /users/login
  */
  Future<void> login({required String email, required String password,}) async {
    try {
      loading.value = true;

      final response = await _dio.post(
        "${dotenv.env['BACKEND_BASE_URL']}/users/login",
        data: {
          "email": email,
          "password": password,
        },
        options: Options(
          validateStatus: (status) => true, // handle status manually
        ),
      );

      if (response.statusCode == 200) {
        final data = response.data['data'];

        final user = data['user'];
        final accessToken = data['accessToken'];
        final refreshToken = data['refreshToken'];

        // Save tokens
        TokenService.saveTokens(accessToken, refreshToken);

        // Save user details
        await saveUserDetails({
          "fullName": user["fullName"],
          "username": user["username"],
          "email": user["email"],
          "id": user["_id"],
          "role": user["role"]
        });

        showSnackBar("Success", response.data["message"] ?? "Login successful");

        // Navigate to home
        Get.toNamed(RouteNames.homePage);
        Get.delete<AuthController>();
      } else {
        showSnackBar("Error", response.data["message"] ?? "Login failed");
      }
    } on DioException catch (e) {
      print(e);
      final message = e.response?.data["message"] ?? "Something went wrong while logging in";
      showSnackBar("Error", message);
    } catch (e) {
      print(e);
      showSnackBar("Error", "Unexpected error occurred");
    } finally {
      loading.value = false;
    }
  }


  /*
  * @desc This is a helper function to store user details locally using GetStorage
  * */
  Future<void> saveUserDetails(Map<String, dynamic> user) async {
    await box.write("fullName", user["fullName"]);
    await box.write("username", user["username"]);
    await box.write("email", user["email"]);
    await box.write("id", user["id"]);
  }


}