import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../routes/route_names.dart';



class SettingController extends GetxController{
  final box = GetStorage();

  /*
  * @desc Logout of the account clear stored local info + tokens and redirect to main
  * */
  void logout() async {
    // Remove stored token
    box.erase();
    // Redirect to Login screen
    Get.offAllNamed(RouteNames.getStarted);
  }
}