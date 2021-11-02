import 'package:get/get.dart';
import 'package:pet_rescue/modules/pet_diary/pet_diary_controller.dart';

class PetDiaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PetDiaryController());
  }
}
