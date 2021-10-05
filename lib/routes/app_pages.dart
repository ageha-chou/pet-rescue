import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_biding.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_screen.dart';
import 'package:pet_rescue/modules/home/main_binding.dart';
import 'package:pet_rescue/modules/home/main_screen.dart';
import 'package:pet_rescue/modules/report/report_pet_binding.dart';
import 'package:pet_rescue/modules/report/report_pet_screen.dart';

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
  ];
}
