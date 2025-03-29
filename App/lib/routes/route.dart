import 'package:get/route_manager.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/auth/getStarted.dart';
import 'package:jpss/views/homePage/homePage.dart';
import 'package:jpss/views/profile/bankDetails.dart';
import 'package:jpss/views/profile/domicileDetails.dart';
import 'package:jpss/views/profile/educationalDetails.dart';
import 'package:jpss/views/profile/hostelDetails.dart';
import 'package:jpss/views/profile/incomeDetails.dart';
import 'package:jpss/views/profile/addressDetails.dart';
import 'package:jpss/views/profile/parentDetails.dart';
import 'package:jpss/views/profile/pastQualification.dart';
import 'package:jpss/views/profile/personalDetails.dart';
import 'package:jpss/views/settings/settings.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.homePage, page: () => const HomePage()),
    GetPage(name: RouteNames.getStarted, page: () => const GetStarted()),
    GetPage(name: RouteNames.personalDetails, page: () => const PersonalDetails()),
    GetPage(name: RouteNames.educationalDetails, page: () => const EducationalDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.addressDetails, page: () => const AddressDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.bankDetails, page: () => const BankDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.parentDetails, page: () => const ParentDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.hostelDetails, page: () => const HostelDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.incomeDetails, page: () => const IncomeDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.domicileDetails, page: () => const DomicileDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.settings, page: () => Setting(),transition: Transition.leftToRight),
    GetPage(name: RouteNames.pastQualifications, page: () => const Pastqualification(),transition: Transition.noTransition),

  ];
}