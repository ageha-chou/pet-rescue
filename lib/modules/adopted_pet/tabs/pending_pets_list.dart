import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../adopted_pet_controller.dart';
import '../adopted_pet_item.dart';

class PendingPetsList extends StatelessWidget {
  final controller = Get.put(AdoptedPetController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: controller.pendingPets.length,
      itemBuilder: (ctx, i) => AdoptedPetItem(
        pet: controller.pendingPets[i],
        isPending: true,
      ),
    );
  }
}
