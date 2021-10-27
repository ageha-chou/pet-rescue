import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class AdoptedPetTabsController extends GetxController
    with SingleGetTickerProviderMixin {
  late final TabController controller;

  final List<Tab> adoptedPetTabs = [
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(FontAwesomeIcons.paw),
            const SizedBox(width: 5.0),
            Text("Your pets"),
          ],
        ),
      ),
    ),
    Tab(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.center,
        child: Row(
          children: [
            Icon(
              Icons.pending,
            ),
            const SizedBox(width: 5.0),
            Text("Adopting pets"),
          ],
        ),
      ),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: adoptedPetTabs.length, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    controller.dispose();
  }
}
