import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AdoptedPetForm extends StatefulWidget {
  const AdoptedPetForm({Key? key}) : super(key: key);

  @override
  State<AdoptedPetForm> createState() => _AdoptedPetFormState();
}

class _AdoptedPetFormState extends State<AdoptedPetForm> {
  bool? quest01;
  bool? quest02;
  bool? quest03;
  int? quest04;
  List imageFiles = [];
  bool? isPending;

  @override
  void initState() {
    super.initState();
    isPending = Get.arguments;
    if (isPending != null) {
      quest01 = true;
      quest02 = true;
      quest03 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Adopted Pet Form'),
      ),
      body: Form(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Do you have enough economic condition to adopt this '
                    'pet?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Yes',
                              style: Theme.of(context).textTheme.headline5),
                          leading: Radio<bool?>(
                            groupValue: quest01,
                            value: true,
                            activeColor: ColorConstants.primary,
                            onChanged: (value) {
                              setState(() {
                                quest01 = value as bool;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text('No',
                              style: Theme.of(context).textTheme.headline5),
                          leading: Radio<bool?>(
                            groupValue: quest01,
                            value: false,
                            activeColor: ColorConstants.primary,
                            onChanged: (value) {
                              setState(() {
                                quest01 = value as bool;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you let your pet have vaccine and sterilization when '
                    'his/her has enough age?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Yes',
                              style: Theme.of(context).textTheme.headline5),
                          leading: Radio<bool?>(
                            groupValue: quest02,
                            value: true,
                            activeColor: ColorConstants.primary,
                            onChanged: (value) {
                              setState(() {
                                quest02 = value as bool;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text('No',
                              style: Theme.of(context).textTheme.headline5),
                          leading: Radio<bool?>(
                            groupValue: quest02,
                            value: false,
                            activeColor: ColorConstants.primary,
                            onChanged: (value) {
                              setState(() {
                                quest02 = value as bool;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Do you have any pet?',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text('Yes',
                              style: Theme.of(context).textTheme.headline5),
                          leading: Radio<bool?>(
                            groupValue: quest03,
                            value: true,
                            activeColor: ColorConstants.primary,
                            onChanged: (value) {
                              setState(() {
                                quest03 = value as bool;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text('No',
                              style: Theme.of(context).textTheme.headline5),
                          leading: Radio<bool?>(
                            groupValue: quest03,
                            value: false,
                            activeColor: ColorConstants.primary,
                            onChanged: (value) {
                              setState(() {
                                quest03 = value as bool;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (quest03 == true) ...[
                    Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ThemeData().colorScheme.copyWith(
                              primary: Color(0xFF0A9396),
                            ),
                      ),
                      child: TextFormField(
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
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(
                        top: 10.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Do you think your pet(s) will be friendly with '
                            'the new one?',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: Text('Yes',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  leading: Radio<int?>(
                                    groupValue: quest04,
                                    value: 1,
                                    activeColor: ColorConstants.primary,
                                    onChanged: (int? value) {
                                      setState(() {
                                        quest04 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: Text('No',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline5),
                                  leading: Radio<int?>(
                                    groupValue: quest04,
                                    value: 3,
                                    activeColor: ColorConstants.primary,
                                    onChanged: (int? value) {
                                      setState(() {
                                        quest04 = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            title: Text('I don\'t know',
                                style: Theme.of(context).textTheme.headline5),
                            leading: Radio<int?>(
                              groupValue: quest04,
                              value: 2,
                              activeColor: ColorConstants.primary,
                              onChanged: (int? value) {
                                setState(() {
                                  quest04 = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
              ),
              child: Text(
                'Upload some images of the place you living',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            const SizedBox(height: 15),
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 5.0,
              ),
              child: imageFiles.length != 0
                  ? Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
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
                              itemCount: imageFiles.length,
                              itemBuilder: (ctx, i) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  width: 100,
                                  child: Image.file(File(imageFiles[i].path),
                                      fit: BoxFit.cover),
                                );
                              }),
                        ),
                        Positioned(
                          right: 0,
                          top: -7,
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  imageFiles.clear();
                                });
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
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
            Container(
              margin: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 10.0,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.offNamedUntil(
                      Routes.HOME, ModalRoute.withName(Routes.HOME));
                  final mainController = Get.find<MainController>();
                  mainController.onSwitchTab(1);
                },
                child: Text(
                  isPending == null ? 'SUBMIT' : 'UPDATE',
                  style: Theme.of(context).textTheme.headline6,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getImage() async {
    List? _imageFiles = (await ImagesPicker.pick(
      // cropOpt: CropOption(
      //   aspectRatio: CropAspectRatio.custom,
      //   cropType: CropType.rect, // currently for android
      // ),
      pickType: PickType.image,
      count: 5,
    ));

    if (_imageFiles != null) {
      setState(() {
        imageFiles = _imageFiles;
      });
    }
  }
}
