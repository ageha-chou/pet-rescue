import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/models/user.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';

class ReportPetController extends GetxController {
  final GlobalKey<FormState> reportForm = GlobalKey();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final petTypeController = TextEditingController();
  final quantityController = TextEditingController();
  final healthController = TextEditingController();
  final noteController = TextEditingController();
  final locationController = TextEditingController();
  var emergencyCase = false.obs;
  var imageFiles = [].obs;
  var selectedSize = "".obs;

  List<DropdownMenuItem> dropdownItems = [];

  User user = Get.find<MainController>().user;

  List _listSize = [
    'Under 2kg',
    '2kg - 5kg',
    '5kg - 7kg',
    '7kg - 9kg',
    '9kg - 15kg',
    '15kg - 20kg',
    'More than 20kg'
  ];

  @override
  void onInit() {
    super.onInit();

    fullNameController.text = user.fullName;
    phoneController.text = user.phone;

    //load data to dropdownItems
    for (String value in _listSize) {
      dropdownItems.add(DropdownMenuItem(
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.weight,
              size: 25,
            ),
            const SizedBox(width: 10),
            Text(value),
          ],
        ),
        value: value,
      ));
    }
  }

  onSelectSize(size) {
    selectedSize.value = size;
  }
}
