import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:jpss/models/profileModel.dart';
import 'package:jpss/utils/helper.dart';
import 'package:get_storage/get_storage.dart';

import '../core/network/dio_client.dart';
import '../routes/route_names.dart';


class ProfileController extends GetxController {
  final _dio = DioClient().client;
  ProfileModel profileModel = ProfileModel();
  CurrentQualification currentQualification = CurrentQualification();
  Rx<bool> completed = false.obs; // Used to observe completed in current education
  PastQualifications pastQualifications = PastQualifications();

  @override
  void onInit(){
    fetchProfile();
    super.onInit();
  }

  /*
  * @desc Used to fetch profile
  * @route GET /profile/
  **/
  Future<void> fetchProfile() async{
    try{
      final response  = await _dio.get(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/",
          options: dio.Options(
            validateStatus: (status) {
              return status != 401;
            },)
      );
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
      } else {
        showSnackBar("Error", response.data["message"] ?? "Registration failed");
      }
    }catch(e){
      print(e);
      showSnackBar("Error", "Something went wrong fetching profile");
    }
  }

  /*
  * @desc
  * @route PUT /profile/personalinfo
  **/
  Future<void> addPersonalDetails() async {
    if (profileModel.personalDetails == null) {
      showSnackBar("Error", "Personal details are incomplete");
      return;
    }

    try {
      // Show loading
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final personal = profileModel.personalDetails!;


      final isLocalFile = File(personal.aadharCard ?? "").existsSync();

      final formData = dio.FormData.fromMap({
        ...personal.toJson(),

        if (personal.aadharCard != null && personal.aadharCard!.isNotEmpty)
          if (isLocalFile)
          // Attach aadhar card only if it is local path (i.e not existing cloudianry path)
            "aadharCard": await dio.MultipartFile.fromFile(
              personal.aadharCard!,
              filename: personal.aadharCard!.split('/').last,
            ),
      });

      final response = await _dio.put(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/personalinfo",
        data: formData,
        options: dio.Options(
          contentType: 'multipart/form-data',
          validateStatus: (status) => status != 401,
        ),
      );

      Get.back(); // Remove loading
      if (response.statusCode == 200) {
        showSnackBar("Success", "Added personal details successfully");
        Get.toNamed(RouteNames.addressDetails);
      } else {
        print(response.data);
        showSnackBar("Error", response.data["message"] ?? "Something went wrong adding personal details");
      }
    } catch (e) {
      Get.back();
      print(e);
      showSnackBar("Error", "Something went wrong adding personal details");
    }
  }



  /*
 * @desc Helper function to convert UTC ISO date to IST and format it
 **/
  String pickedDateToFormattedDate(String isoDate) {
    try {
      final utcDate = DateTime.parse(isoDate);
      final istDate = utcDate.toLocal(); // Converts to IST if device is in India
      return "${istDate.year}-${istDate.month.toString().padLeft(2, '0')}-${istDate.day.toString().padLeft(2, '0')}";
    } catch (e) {
      return "";
    }
  }

}
