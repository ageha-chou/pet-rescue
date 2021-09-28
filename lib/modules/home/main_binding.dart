import 'package:get/get.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
  }
}
