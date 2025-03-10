import 'package:get/route_manager.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/auth/getStarted.dart';
import 'package:jpss/views/homePage/homePage.dart';
import 'package:jpss/views/profile/bankDetails.dart';
import 'package:jpss/views/profile/domicileDetails.dart';
import 'package:jpss/views/profile/educationalDetails.dart';
import 'package:jpss/views/profile/hostelDetails.dart';
import 'package:jpss/views/profile/incomeDetails.dart';
import 'package:jpss/views/profile/otherDetails.dart';
import 'package:jpss/views/profile/parentDetails.dart';
import 'package:jpss/views/profile/personalDetails.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.homePage, page: () => const HomePage()),
    GetPage(name: RouteNames.getStarted, page: () => const GetStarted()),
    GetPage(name: RouteNames.personalDetails, page: () => const personalDetails()),
    GetPage(name: RouteNames.educationalDetails, page: () => const educationalDetails()),
    GetPage(name: RouteNames.otherDetails, page: () => const otherDetails()),
    GetPage(name: RouteNames.bankDetails, page: () => const bankDetails()),
    GetPage(name: RouteNames.parentDetails, page: () => const parentDetails()),
    GetPage(name: RouteNames.hostelDetails, page: () => const hostelDetails()),
    GetPage(name: RouteNames.incomeDetails, page: () => const incomeDetails()),
    GetPage(name: RouteNames.domicileDetails, page: () => const domicileDetails()),

  ];
}