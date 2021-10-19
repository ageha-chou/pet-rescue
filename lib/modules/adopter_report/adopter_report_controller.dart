import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/models/report.dart';

class AdopterReportController extends GetxController {
  var currentStep = 0.obs;

  var isCompleted = false.obs;

  List<DropdownMenuItem<String>> reasons = [];
  var selectedReasons = "".obs;

  Report report = Report(
    location: '153 Nguyễn Thông, Phường 9, Quận 3, TPHCM',
    petType: 'Cat',
    quantity: 2,
    petSize: 'Under 2kg',
    healCondition: 'Bleeding',
    images: [
      Image.network('https://i.redd.it/8c6p67ikaoe71.jpg', fit: BoxFit.cover),
      Image.network(
          'https://www.hospitalveterinariglories'
          '.com/wp-content/uploads/2019/04/Toxoplasmosis-en-gatos-676x449.jpeg',
          fit: BoxFit.cover),
    ],
    emergencyCase: true,
  );

  List _listReason = [
    'I\'m busy right now, cannot wait for volunteer',
    'I found someone wants to adopt this pet',
    'Other reasons',
  ];

  @override
  void onInit() {
    super.onInit();

    for (String value in _listReason) {
      reasons.add(
        DropdownMenuItem(
          child: Text(
            value,
            style: Theme.of(Get.context!).textTheme.headline6,
            // overflow: TextOverflow.ellipsis,
          ),
          value: value,
        ),
      );
    }
  }
}
