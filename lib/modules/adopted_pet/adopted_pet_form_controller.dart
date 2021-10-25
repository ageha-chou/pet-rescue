import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_controller.dart';

class AdoptedPetFormController extends GetxController {
  AdoptedPet? pet;

  final petNameController = TextEditingController();
  final petWeightController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    if (pet != null) {
      petNameController.text = pet!.name;
      petWeightController.text = pet!.weight.replaceAll('kg', '');
    }
  }
}
