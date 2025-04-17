import 'package:get/route_manager.dart';
import 'package:jpss/routes/route_names.dart';
import 'package:jpss/views/auth/getStarted.dart';
import 'package:jpss/views/displayDocument/displayDocument.dart';
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
import 'package:jpss/views/scholarships/scholarshipDetail.dart';
import 'package:jpss/views/settings/settings.dart';

class Routes{
  static final pages = [
    GetPage(name: RouteNames.homePage, page: () => const HomePage()),
    GetPage(name: RouteNames.getStarted, page: () => const GetStarted()),
    GetPage(name: RouteNames.personalDetails, page: () => const PersonalDetailsScreen()),
    GetPage(name: RouteNames.educationalDetails, page: () => EducationalDetails(),transition: Transition.noTransition),
    GetPage(name: RouteNames.addressDetails, page: () => const AddressDetailsScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.bankDetails, page: () => const BankDetailsScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.parentDetails, page: () => const ParentDetailsScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.hostelDetails, page: () => const HostelDetailsScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.incomeDetails, page: () => const IncomeDetailsScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.domicileDetails, page: () => const DomicileDetailsScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.settings, page: () => Setting(),transition: Transition.leftToRight),
    GetPage(name: RouteNames.pastqualification, page: () => PastQualificationScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.scholarshipDetails, page: () => const ScholarshipDetailScreen(),transition: Transition.noTransition),
    GetPage(name: RouteNames.displayDocument, page: () => const DisplayDocument(),transition: Transition.cupertino),


  ];
}