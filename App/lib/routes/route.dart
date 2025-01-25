import 'package:get/route_manager.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/auth/getStarted.dart';
import 'package:jpss/views/homePage/homePage.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.homePage, page: () => const HomePage()),
    GetPage(name: RouteNames.getStarted, page: () => const GetStarted()),
  ];

}