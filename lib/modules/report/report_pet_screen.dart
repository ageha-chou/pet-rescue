import 'dart:io';
import 'dart:async';

import 'package:dropdown_below/dropdown_below.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:images_picker/images_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pet_rescue/modules/report/report_pet_controller.dart';
import 'package:pet_rescue/shared/constants/color.dart';
import 'package:pet_rescue/shared/shared.dart';

class ReportPetScreen extends GetView<ReportPetController> {
  static const LatLng center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: AppLogo(),
        title: Text(
          'Report Abandoned Pet',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.clear,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.reportForm,
          child: ListView(
            children: [
              Row(
                children: [
                  Text(
                    'Emergency case:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Obx(
                    () => Checkbox(
                        activeColor: Color(0xFF0A9396),
                        value: controller.emergencyCase.value,
                        onChanged: (value) {
                          if (controller.report != null) return null;
                          controller.emergencyCase.value = value!;
                        }),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Theme(
              //   data: Theme.of(context).copyWith(
              //     colorScheme: ThemeData().colorScheme.copyWith(
              //           primary: Color(0xFF0A9396),
              //         ),
              //   ),
              //   child: TextFormField(
              //     style: Theme.of(context).textTheme.headline6,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(
              //         FontAwesomeIcons.user,
              //         color: Color(0xFFb5b0ac,
              //       ),
              //       labelText: 'Full name',
              //       labelStyle: Theme.of(context).textTheme.headline6,
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xFFb5b0ac),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xFF0A9396)),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     textInputAction: TextInputAction.next,
              //     controller: controller.fullNameController,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Full name is required';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Theme(
              //   data: Theme.of(context).copyWith(
              //     colorScheme: ThemeData().colorScheme.copyWith(
              //           primary: Color(0xFF0A9396),
              //         ),
              //   ),
              //   child: TextFormField(
              //     style: Theme.of(context).textTheme.headline6,
              //     decoration: InputDecoration(
              //       prefixIcon: Icon(
              //         FontAwesomeIcons.phone,
              //         color: Color(0xFFb5b0ac,
              //       ),
              //       labelText: 'Phone',
              //       labelStyle: Theme.of(context).textTheme.headline6,
              //       enabledBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xFFb5b0ac),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //       focusedBorder: OutlineInputBorder(
              //         borderSide: BorderSide(color: Color(0xFF0A9396)),
              //         borderRadius: BorderRadius.circular(10),
              //       ),
              //     ),
              //     textInputAction: TextInputAction.next,
              //     controller: controller.phoneController,
              //     validator: (value) {
              //       if (value!.isEmpty) {
              //         return 'Phone is required';
              //       }
              //       return null;
              //     },
              //   ),
              // ),
              // InternationalPhoneNumberInput(
              //   keyboardType: TextInputType.phone,
              //   textStyle: Theme.of(context).textTheme.headline6,
              //   selectorTextStyle: Theme.of(context).textTheme.headline6,
              //   inputDecoration: InputDecoration(
              //     hintText: 'Phone',
              //     hintStyle: Theme.of(context).textTheme.headline6,
              //     enabledBorder: OutlineInputBorder(
              //                       borderSide: BorderSide(color: Color
              //                       (0xFFb5b0ac),
              //                       borderRadius: BorderRadius.circular(10),
              //                     ),
              //     focusedBorder: OutlineInputBorder(
              //       borderSide: BorderSide(color: Color(0xFF0A9396)),
              //       borderRadius: BorderRadius.circular(10),
              //     ),
              //   ),
              //   textFieldController: controller.phoneController,
              //   ignoreBlank: true,
              //   countrySelectorScrollControlled: false,
              //   countries: ['VN'],
              //   formatInput: true,
              //   // initialValue: PhoneNumber(isoCode: 'VN'),
              //   selectorConfig: SelectorConfig(
              //     showFlags: true,
              //   ),
              //   onInputChanged: (phone) {},
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Phone number is required';
              //     }
              //   },
              // ),
              // const SizedBox(height: 20),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Color(0xFF0A9396),
                      ),
                ),
                child: TextFormField(
                  style: Theme.of(context).textTheme.headline6,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.map,
                      color: Color(0xFFb5b0ac),
                    ),
                    labelText: 'Location',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    hintText: 'Tap to choose your location',
                    hintStyle: Theme.of(context).textTheme.headline6,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0A9396)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  controller: controller.locationController,
                  minLines: 1,
                  maxLines: 3,
                  readOnly: true,
                  keyboardType: TextInputType.multiline,
                  onTap: () {
                    if (controller.report != null) return null;
                    Get.to(() => MyGoogleMap());
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please choose your location';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => DropdownBelow(
                  itemWidth: 350,
                  icon: Icon(Icons.arrow_drop_down),
                  itemTextstyle: Theme.of(context).textTheme.headline6,
                  boxTextstyle: Theme.of(context).textTheme.headline6,
                  boxPadding: EdgeInsets.symmetric(horizontal: 14),
                  boxHeight: 60,
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFb5b0ac)),
                  ),
                  hint: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.paw,
                        color: Color(0xFFb5b0ac),
                        size: 25,
                      ),
                      const SizedBox(width: 10),
                      Text('Choose Pet type'),
                    ],
                  ),
                  items: controller.dropdownType,
                  value: controller.selectedType.value == ""
                      ? null
                      : controller.selectedType.value,
                  onChanged: (value) {
                    if (controller.report != null) return null;
                    controller.selectedType.value = value.toString();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Color(0xFF0A9396),
                      ),
                ),
                child: TextFormField(
                  readOnly: controller.report != null ? true : false,
                  style: Theme.of(context).textTheme.headline6,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      FontAwesomeIcons.calculator,
                      color: Color(0xFFb5b0ac),
                    ),
                    labelText: 'Quantity',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    hintText: '1',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0A9396)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  controller: controller.quantityController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Quantity is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => DropdownBelow(
                  itemWidth: 350,
                  icon: Icon(Icons.arrow_drop_down),
                  itemTextstyle: Theme.of(context).textTheme.headline6,
                  boxTextstyle: Theme.of(context).textTheme.headline6,
                  boxPadding: EdgeInsets.symmetric(horizontal: 14),
                  boxHeight: 60,
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFb5b0ac)),
                  ),
                  hint: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.weight,
                        color: Color(0xFFb5b0ac),
                        size: 25,
                      ),
                      const SizedBox(width: 10),
                      Text('Choose Pet size'),
                    ],
                  ),
                  items: controller.dropdownSize,
                  value: controller.selectedSize.value == ""
                      ? null
                      : controller.selectedSize.value,
                  onChanged: (value) {
                    if (controller.report != null) return null;
                    controller.selectedSize.value = value.toString();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => DropdownBelow(
                  itemWidth: 350,
                  icon: Icon(Icons.arrow_drop_down),
                  itemTextstyle: Theme.of(context).textTheme.headline6,
                  boxTextstyle: Theme.of(context).textTheme.headline6,
                  boxPadding: EdgeInsets.symmetric(horizontal: 14),
                  boxHeight: 60,
                  boxDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Color(0xFFb5b0ac)),
                  ),
                  hint: Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.notesMedical,
                        color: Color(0xFFb5b0ac),
                        size: 25,
                      ),
                      const SizedBox(width: 10),
                      Text('Choose Pet Health Condition'),
                    ],
                  ),
                  items: controller.dropdownHealth,
                  value: controller.selectedHealth.value == ""
                      ? null
                      : controller.selectedHealth.value,
                  onChanged: (value) {
                    if (controller.report != null) return null;
                    controller.selectedHealth.value = value.toString();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Theme(
                data: Theme.of(context).copyWith(
                  colorScheme: ThemeData().colorScheme.copyWith(
                        primary: Color(0xFF0A9396),
                      ),
                ),
                child: TextFormField(
                  readOnly: controller.report != null ? true : false,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: InputDecoration(
                    prefixIcon: Icon(FontAwesomeIcons.stickyNote,
                        color: Color(0xFFb5b0ac)),
                    labelText: 'Note',
                    labelStyle: Theme.of(context).textTheme.headline6,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF0A9396)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  controller: controller.noteController,
                  minLines: 1,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  // validator: (value) {
                  //   if (value!.isEmpty) {
                  //     return 'Description is required';
                  //   }
                  //   return null;
                  // },
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => controller.imageFiles.length != 0
                    ? Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xFFb5b0ac)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0)),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 30,
                              horizontal: 10,
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.imageFiles.length,
                                itemBuilder: (ctx, i) {
                                  return Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    width: 100,
                                    child: controller.report == null
                                        ? Image.file(
                                            File(controller.imageFiles[i].path),
                                            fit: BoxFit.cover)
                                        : controller.imageFiles[i],
                                  );
                                }),
                          ),
                          if (controller.report == null)
                            Positioned(
                              right: 0,
                              top: -7,
                              child: IconButton(
                                  onPressed: () {
                                    controller.imageFiles.clear();
                                  },
                                  icon: Icon(Icons.clear)),
                            ),
                        ],
                      )
                    : InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        onTap: () async {
                          getImage();
                        },
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xFFb5b0ac)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Color(0xFFb5b0ac),
                              ),
                              Text(
                                'Upload image',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              if (controller.report == null)
                ElevatedButton(
                  onPressed: () {
                    Get.back(result: true);
                  },
                  child: Text(
                    'SUBMIT',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage() async {
    controller.imageFiles.value = (await ImagesPicker.pick(
      // cropOpt: CropOption(
      //   aspectRatio: CropAspectRatio.custom,
      //   cropType: CropType.rect, // currently for android
      // ),
      pickType: PickType.image,
      count: 5,
    ))!;
  }

  void _insertText(String myText, TextEditingController controller) {
    final text = controller.text;
    final textSelection = controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    controller.text = newText;
    controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }
}
