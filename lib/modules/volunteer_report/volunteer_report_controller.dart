
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/models/report.dart';

class VolunteerReportController extends GetxController{
  var currentStep = 0.obs;

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

  @override
  void onInit() {
    super.onInit();
  }
}