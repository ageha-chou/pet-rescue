import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_controller.dart';

class AdopterReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AdopterReportController());
  }
}
