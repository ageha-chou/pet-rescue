import 'dart:io';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            icon: Icon(Icons.clear),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.reportForm,
          child: ListView(
            children: [
              TextFormField(
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  labelText: 'Full name',
                  labelStyle: Theme.of(context).textTheme.headline6,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                controller: controller.fullNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Full name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              InternationalPhoneNumberInput(
                keyboardType: TextInputType.phone,
                textStyle: Theme.of(context).textTheme.headline6,
                selectorTextStyle: Theme.of(context).textTheme.headline6,
                inputDecoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: Theme.of(context).textTheme.headline6,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                textFieldController: controller.phoneController,
                ignoreBlank: true,
                countrySelectorScrollControlled: false,
                countries: ['VN'],
                formatInput: true,
                // initialValue: PhoneNumber(isoCode: 'VN'),
                selectorConfig: SelectorConfig(
                  showFlags: true,
                ),
                onInputChanged: (phone) {},
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Phone number is required';
                  }
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  labelText: 'Description',
                  labelStyle: Theme.of(context).textTheme.headline6,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                controller: controller.descriptionController,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Description is required';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              TextFormField(
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  labelText: 'Location',
                  labelStyle: Theme.of(context).textTheme.headline6,
                  hintText: 'Tap to choose your location',
                  hintStyle: Theme.of(context).textTheme.headline6,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                textInputAction: TextInputAction.next,
                controller: controller.locationController,
                minLines: 1,
                maxLines: 3,
                readOnly: true,
                keyboardType: TextInputType.multiline,
                onTap: () => Get.to(() => MyGoogleMap()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please choose your location';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Obx(
                () => controller.imageFiles.length != 0
                    ? Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: ColorConstants.black),
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
                                    child: Image.file(
                                        File(controller.imageFiles[i].path),
                                        fit: BoxFit.cover),
                                  );
                                }),
                          ),
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
                        onTap: () async {
                          getImage();
                        },
                        child: Container(
                          height: 180,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorConstants.black),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.camera_alt,
                                size: 50,
                                color: Colors.grey,
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
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Submit',
                  style: Theme.of(context).textTheme.headline6,
                ),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
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
    print(controller.imageFiles.length);
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
