import 'dart:convert';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jpss/models/profileModel.dart';
import 'package:jpss/utils/helper.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  final _dio = Dio();
  final _box = GetStorage();
  ProfileModel profileModel = ProfileModel();

  @override
  void onInit(){
    fetchProfile();
    super.onInit();
  }

  Future<void> fetchProfile() async{
    try{
      final token = _box.read('accessToken');
      final response  = await _dio.get(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/",
          options: Options(
            headers: {
              'Authorization': 'Bearer $token',
            },
            validateStatus: (status) {
              return true;
            },)
      );
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
      } else {
        showSnackBar("Error", response.data["message"] ?? "Registration failed");
      }
    }catch(e){
      showSnackBar("Error", "Something went wrong fetching profile");
    }
  }
}
