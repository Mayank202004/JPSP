import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:pmsss/routes/route_names.dart';
import 'package:pmsss/services/storage_services.dart';
import 'package:pmsss/services/supabase_service.dart';
import 'package:pmsss/utils/helper.dart';
import 'package:pmsss/utils/storage_keys.dart';

class AuthController extends GetxController{

  var registerLoading = false.obs;
  var loginLoading = false.obs;

  Future<void> register(String name,String email,String password) async{

    try{
      registerLoading.value = true;
      final AuthResponse data = await SupabaseService.client.auth.
      signUp(email: email,password: password,data: {"name": name});
      registerLoading.value = false;
      if(data.user != Null){
        StorageService.session.write(
            StorageKeys.userSession,
            data.session!.toJson()
        );
        Get.offAllNamed(RouteNames.homePage);
      }

    } on AuthException catch(error){
      registerLoading.value = true;
      showSnackBar("Error: ", error.message);
      registerLoading.value = false;
    }
  }

  Future<void> login(String email,String password) async {
    try{
      loginLoading.value = true;
      final AuthResponse response = await SupabaseService.client.auth.
      signInWithPassword(email: email,password: password);
      loginLoading.value = false;
      if(response.user != Null){
        StorageService.session.write(
            StorageKeys.userSession,
            response.session!.toJson()
        );
        Get.offAllNamed(RouteNames.homePage);
      }

    } on AuthException catch(error){
      loginLoading.value = true;
      showSnackBar("Error", error.message);
      loginLoading.value= false;
    }
  }
}