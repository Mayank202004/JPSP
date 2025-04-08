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
        profileModel = ProfileModel.fromJson(response.data["data"]);
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
  * @desc Add address details
  * @route PUT /profile/addressinfo
  **/
  Future<void> addAddressDetails() async {
    if (profileModel.address == null) {
      showSnackBar("Error", "address details are incomplete");
      return;
    }

    try {
      // Show loading
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final address = profileModel.address!;

      final response = await _dio.put(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/addressinfo",
        data: address.toJson(),
        options: dio.Options(
          validateStatus: (status) => status != 401,
        ),
      );

      Get.back(); // Remove loading
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
        showSnackBar("Success", "Added address details successfully");
        Get.toNamed(RouteNames.educationalDetails);
      } else {
        print(response.data);
        showSnackBar("Error", response.data["message"] ?? "Something went wrong adding address details");
      }
    } catch (e) {
      Get.back();
      print(e);
      showSnackBar("Error", "Something went wrong adding address details");
    }
  }

  /*
  * @desc Add domicile details
  * @route PUT /profile/domicileinfo
  **/
  Future<void> addDomicileDetails() async {
    if (profileModel.domicileDetails == null) {
      showSnackBar("Error", "Domicile details are incomplete");
      return;
    }

    try {
      // Show loading
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final domicile = profileModel.domicileDetails!;


      final isLocalFile = File(domicile.domicileCertificate ?? "").existsSync();

      final formData = dio.FormData.fromMap({
        ...domicile.toJson(),

        if (domicile.domicileCertificate != null && domicile.domicileCertificate!.isNotEmpty)
          if (isLocalFile)
          // Attach domicile  only if it is local path (i.e not existing cloudianry path)
            "domicileCertificate": await dio.MultipartFile.fromFile(
              domicile.domicileCertificate!,
              filename: domicile.domicileCertificate!.split('/').last,
            ),
      });

      final response = await _dio.put(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/domicileinfo",
        data: formData,
        options: dio.Options(
          contentType: 'multipart/form-data',
          validateStatus: (status) => status != 401,
        ),
      );

      Get.back(); // Remove loading
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
        showSnackBar("Success", "Added domicile details successfully");
        Get.toNamed(RouteNames.incomeDetails);
      } else {
        print(response.data);
        showSnackBar("Error", response.data["message"] ?? "Something went wrong adding domicile details");
      }
    } catch (e) {
      Get.back();
      print(e);
      showSnackBar("Error", "Something went wrong adding domicile details");
    }
  }

  /*
  * @desc Add income details
  * @route PUT /profile/incomeinfo
  **/
  Future<void> addIncomeDetails() async {
    if (profileModel.incomeDetails == null) {
      showSnackBar("Error", "Income details are incomplete");
      return;
    }

    try {
      // Show loading
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final income = profileModel.incomeDetails!;

      final isLocalFile = File(income.incomeCertificate ?? "").existsSync();

      final formData = dio.FormData.fromMap({
        ...income.toJson(),

        if (income.incomeCertificate != null && income.incomeCertificate!.isNotEmpty)
          if (isLocalFile)
          // Attach income certificate only if it is local path (i.e not existing cloudianry path)
            "incomeCertificate": await dio.MultipartFile.fromFile(
              income.incomeCertificate!,
              filename: income.incomeCertificate!.split('/').last,
            ),
      });

      final response = await _dio.put(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/incomeinfo",
        data: formData,
        options: dio.Options(
          contentType: 'multipart/form-data',
          validateStatus: (status) => status != 401,
        ),
      );

      Get.back(); // Remove loading
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
        showSnackBar("Success", "Added income details successfully");
        Get.toNamed(RouteNames.bankDetails);
      } else {
        print(response.data);
        showSnackBar("Error", response.data["message"] ?? "Something went wrong adding income details");
      }
    } catch (e) {
      Get.back();
      print(e);
      showSnackBar("Error", "Something went wrong adding income details");
    }
  }

  /*
  * @desc Add bank details
  * @route PUT /profile/bankinfo
  **/
  Future<void> addBankDetails() async {
    if (profileModel.bankDetails == null) {
      showSnackBar("Error", "Bank details are incomplete");
      return;
    }

    try {
      // Show loading
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final bank = profileModel.bankDetails!;

      final response = await _dio.put(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/bankinfo",
        data: bank.toJson(),
        options: dio.Options(
          validateStatus: (status) => status != 401,
        ),
      );

      Get.back(); // Remove loading
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
        showSnackBar("Success", "Added bank details successfully");
        Get.toNamed(RouteNames.parentDetails);
      } else {
        print(response.data);
        showSnackBar("Error", response.data["message"] ?? "Something went wrong adding bank details");
      }
    } catch (e) {
      Get.back();
      print(e);
      showSnackBar("Error", "Something went wrong adding bank details");
    }
  }

  /*
  * @desc Add parents details
  * @route PUT /profile/bankinfo
  **/
  Future<void> addParentDetails() async {
    if (profileModel.parentsDetails == null) {
      showSnackBar("Error", "Parent details are incomplete");
      return;
    }

    try {
      // Show loading
      Get.dialog(const Center(child: CircularProgressIndicator()), barrierDismissible: false);

      final parent = profileModel.hostelDetails!;

      final response = await _dio.put(
        "${dotenv.env['BACKEND_BASE_URL']}/profile/parentinfo",
        data: parent.toJson(),
        options: dio.Options(
          validateStatus: (status) => status != 401,
        ),
      );

      Get.back(); // Remove loading
      if (response.statusCode == 200) {
        profileModel = ProfileModel.fromJson(response.data["data"]);
        showSnackBar("Success", "Added parent details successfully");
        Get.toNamed(RouteNames.parentDetails);
      } else {
        print(response.data);
        showSnackBar("Error", response.data["message"] ?? "Something went wrong adding parent details");
      }
    } catch (e) {
      Get.back();
      print(e);
      showSnackBar("Error", "Something went wrong adding parent details");
    }
  }

  /*
  * @desc Function to determine which form page is incomplete
  * */
  void findIncompleteForm(){
    if(profileModel!.isPersonalDetailsFilled == false){
      Get.toNamed(RouteNames.personalDetails);
    }
    else if(profileModel.isAddressFilled  == false){
      Get.toNamed(RouteNames.addressDetails);
    }
    else if(profileModel.isCurrentQualificationsFilled == false){
      Get.toNamed(RouteNames.educationalDetails);
    }
    else if(profileModel.isPastQualificationsFilled == false){
      Get.toNamed(RouteNames.pastqualification);
    }
    else if(profileModel.domicileDetails == false){
      Get.toNamed(RouteNames.domicileDetails);
    }
    else if(profileModel.isIncomeDetailsFilled == false){
      Get.toNamed(RouteNames.incomeDetails);
    }
    else if(profileModel.isBankDetailsFilled == false){
      Get.toNamed(RouteNames.bankDetails);
    }
    else if(profileModel.isParentsDetailsFilled == false){
      Get.toNamed(RouteNames.parentDetails);
    }
    else if(profileModel.isHostelDetailsFilled == false){
      Get.toNamed(RouteNames.hostelDetails);
    }
    else{
      Get.toNamed(RouteNames.personalDetails);
      profileCompleteDialog();

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
