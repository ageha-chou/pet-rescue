import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportPetController extends GetxController {
  final GlobalKey<FormState> reportForm = GlobalKey();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  var imageFiles = [].obs;

  @override
  void onInit() {
    super.onInit();
  }
}
