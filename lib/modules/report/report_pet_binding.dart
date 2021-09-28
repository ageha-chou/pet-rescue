import 'package:get/get.dart';
import 'package:pet_rescue/modules/report/report_pet_controller.dart';

class ReportPetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportPetController>(() => ReportPetController());
  }
}
