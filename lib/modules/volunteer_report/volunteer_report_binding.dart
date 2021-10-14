

import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:pet_rescue/modules/volunteer_report/volunteer_report_controller.dart';

class VolunteerReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VolunteerReportController());
  }
}