import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/edit_adopted_pet.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_biding.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_screen.dart';
import 'package:pet_rescue/modules/adopter_report/volunteer_route.dart';
import 'package:pet_rescue/modules/home/main_binding.dart';
import 'package:pet_rescue/modules/home/main_screen.dart';
import 'package:pet_rescue/modules/pet_diary/pet_diary_screen.dart';
import 'package:pet_rescue/modules/report/report_pet_binding.dart';
import 'package:pet_rescue/modules/report/report_pet_screen.dart';
import 'package:pet_rescue/modules/volunteer_report/pet_waiting_screen.dart';
import 'package:pet_rescue/modules/volunteer_report/reportter_route.dart';
import 'package:pet_rescue/modules/volunteer_report/volunteer_report_binding.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: Routes.REPORT,
      page: () => ReportPetScreen(),
      binding: ReportPetBinding(),
    ),
    GetPage(
      name: Routes.ADOPTER_REPORT_LIST,
      page: () => AdopterReportScreen(),
      binding: AdopterReportBinding(),
    ),
    GetPage(
      name: Routes.VOLUNTEER_REPORT_LIST,
      page: () => WaitingPetScreen(),
      binding: VolunteerReportBinding(),
    ),
    GetPage(
      name: Routes.EDIT_ADOPTED_PET,
      page: () => EditAdoptedPet(),
    ),
    GetPage(
      name: Routes.PET_DIARY,
      page: () => PetDiaryScreen(),
    ),
    GetPage(
      name: Routes.VOLUNTEER_ROUTE,
      page: () => VolunteerRoute(),
    ),
    GetPage(
      name: Routes.REPORTER_ROUTE,
      page: () => ReporterRoute(),
    ),
  ];
}

//REPORTER_ROUTE
