import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopter_report/adopter_report_controller.dart';

class AdopterReportScreen extends GetView<AdopterReportController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Reported Pets'),
      ),
    );
  }
}
