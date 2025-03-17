import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/route_names.dart';



class SettingController extends GetxController{
  // final box = GetStorage();
  void logout() async {
    // Remove stored token
    // await box.remove('authToken');
    // await box.remove('name');
    // await box.remove('email');
    // await box.remove('RegistrationNo');
    // await box.remove('UserId');
    // await box.remove('profilePhoto');
    // await box.remove('dept');
    // await box.remove('bloodgroup');
    // await box.remove('contactnumber');
    // await box.remove('address');
    // Redirect to Login screen
    Get.offAllNamed(RouteNames.getStarted);
  }
}