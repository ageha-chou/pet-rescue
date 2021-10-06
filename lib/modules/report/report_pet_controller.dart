import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/models/report.dart';
import 'package:pet_rescue/models/user.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';

class ReportPetController extends GetxController {
  final GlobalKey<FormState> reportForm = GlobalKey();
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final quantityController = TextEditingController();
  final noteController = TextEditingController();
  final locationController = TextEditingController();
  var emergencyCase = false.obs;
  var imageFiles = [].obs;
  var selectedSize = "".obs;
  var selectedType = "".obs;
  var selectedHealth = "".obs;

  List<DropdownMenuItem> dropdownSize = [];
  List<DropdownMenuItem> dropdownType = [];
  List<DropdownMenuItem> dropdownHealth = [];

  User user = Get.find<MainController>().user;

  Report? report;

  List _listSize = [
    'Under 2kg',
    '2kg - 5kg',
    '5kg - 7kg',
    '7kg - 9kg',
    '9kg - 15kg',
    '15kg - 20kg',
    'More than 20kg'
  ];

  List _listType = [
    "Cat",
    "Dog",
    "Rabbit",
    "squirrel",
  ];

  List _listHealth = ["Healthy", "Unconscious", "Injured", "Bleeding"];

  @override
  void onInit() {
    super.onInit();

    fullNameController.text = user.fullName;
    phoneController.text = user.phone;

    report = Get.arguments;

    //load data to dropdownSize
    for (String value in _listSize) {
      dropdownSize.add(DropdownMenuItem(
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.weight,
              color: Color(0xFFb5b0ac),
              size: 25,
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: Theme.of(Get.context!).textTheme.headline6,
            ),
          ],
        ),
        value: value,
      ));
    }

    //load data to dropdownType
    for (String value in _listType) {
      dropdownType.add(DropdownMenuItem(
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.paw,
              color: Color(0xFFb5b0ac),
              size: 25,
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: Theme.of(Get.context!).textTheme.headline6,
            ),
          ],
        ),
        value: value,
      ));
    }

    //load data to dropdownHealth
    for (String value in _listHealth) {
      dropdownHealth.add(DropdownMenuItem(
        child: Row(
          children: [
            Icon(
              FontAwesomeIcons.notesMedical,
              color: Color(0xFFb5b0ac),
              size: 25,
            ),
            const SizedBox(width: 10),
            Text(
              value,
              style: Theme.of(Get.context!).textTheme.headline6,
            ),
          ],
        ),
        value: value,
      ));
    }
  }

  @override
  onReady() {
    if (report != null) {
      selectedType.value = report!.petType;
      selectedSize.value = report!.petSize;
      quantityController.text = report!.quantity.toString();
      noteController.text = report!.note;
      locationController.text = report!.location;
      selectedHealth.value = report!.healCondition;
      imageFiles.value = report!.images;
      emergencyCase.value = report!.emergencyCase;
    }
  }

  onSelectSize(size) {
    selectedSize.value = size;
  }

  onSelectType(type) {
    selectedType.value = type;
  }

  onSelectHealth(health) {
    selectedHealth.value = health;
  }
}
