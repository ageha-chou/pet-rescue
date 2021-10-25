import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_controller.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_item.dart';

class AdoptedPetList extends StatelessWidget {
  final controller = Get.put(AdoptedPetController());
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.adoptedPets.length,
      itemBuilder: (ctx, i) => AdoptedPetItem(
        pet: controller.adoptedPets[i],
      ),
    );
  }
}
