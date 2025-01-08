import 'package:get/route_manager.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/auth/login.dart';
import 'package:jpss/views/auth/register.dart';
import 'package:jpss/views/homePage/homePage.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.homePage, page: () => HomePage()),
    GetPage(name: RouteNames.login, page: () => Login(),transition: Transition.fade),
    GetPage(name: RouteNames.register, page: () => Register(),transition: Transition.fadeIn),
    //GetPage(name: RouteNames.editProfile, page: () => EditProfile(),transition: Transition.leftToRight),
    //GetPage(name: RouteNames.profile, page: () => Profile(),transition: Transition.leftToRight),

  ];

}