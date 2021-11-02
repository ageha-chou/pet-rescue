import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:images_picker/images_picker.dart';

class AddDiary extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<AddDiary> {
  String? _currentSelectedValue;
  String? _selectedMainActivity;
  String? _selectedHealthCondition;
  List imageFiles = [];
  // DateTime selectedDate = DateTime.now();

  // _selectDate(BuildContext context) async {
  //   final DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: selectedDate,
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2025),
  //   );
  //   if (picked != null && picked != selectedDate)
  //     setState(() {
  //       selectedDate = picked;
  //     });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Add new diary'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 30,
        ),
        child: Form(
          child: ListView(children: [
            DropdownButtonFormField(
                value: _currentSelectedValue,
                isDense: true,
                style: Theme.of(context).textTheme.headline6,
                hint: Text(
                  'Choose your pet',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: InputDecoration(
                  labelText: 'Pet',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0A9396)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelStyle: Theme.of(context).textTheme.headline6,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Susu"),
                    value: "Sushi",
                  ),
                  DropdownMenuItem(
                    child: Text("Tom"),
                    value: "Mit",
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    _currentSelectedValue = newValue!;
                  });
                }),

            const SizedBox(height: 16.0),
            // MyTextFieldDatePicker(
            //   labelText: "Date",
            //   dateFormat: DateFormat("yyyy-MM-dd"),
            //   /*prefixIcon: Icon(Icons.date_range),
            //   suffixIcon: Icon(Icons.arrow_drop_down),*/
            //   lastDate: DateTime.now().add(Duration(days: 366)),
            //   firstDate: DateTime.now(),
            //   initialDate: DateTime.now().add(Duration(days: 1)),
            //   onDateChanged: (selectedDate) {
            //     // Do something with the selected date
            //   },
            // ),
            // const SizedBox(height: 16.0),
            DropdownButtonFormField(
                style: Theme.of(context).textTheme.headline6,
                hint: Text(
                  'Choose activity',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: InputDecoration(
                  labelText: 'Main Activity',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0A9396)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelStyle: Theme.of(context).textTheme.headline6,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Vaccinate"),
                    value: "Vaccinate",
                  ),
                  DropdownMenuItem(
                    child: Text("Deworm"),
                    value: "Deworm",
                  ),
                  DropdownMenuItem(
                    child: Text("Sterilize"),
                    value: "Sterilize",
                  ),
                  DropdownMenuItem(
                    child: Text("Other"),
                    value: "Other",
                  ),
                ],
                value: _selectedMainActivity,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedMainActivity = newValue!;
                  });
                }),
            const SizedBox(height: 16.0),
            DropdownButtonFormField(
                style: Theme.of(context).textTheme.headline6,
                hint: Text(
                  'Choose pet health condition',
                  style: Theme.of(context).textTheme.headline6,
                ),
                decoration: InputDecoration(
                  labelText: 'Health condition',
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0A9396)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelStyle: Theme.of(context).textTheme.headline6,
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Healthy"),
                    value: "Healthy",
                  ),
                  DropdownMenuItem(
                    child: Text("Lose appetite"),
                    value: "Lose appetite",
                  ),
                  DropdownMenuItem(
                    child: Text("Vomiting"),
                    value: "Vomiting",
                  ),
                  DropdownMenuItem(
                    child: Text("Other"),
                    value: "Other",
                  ),
                ],
                value: _selectedHealthCondition,
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedHealthCondition = newValue!;
                  });
                }),
            const SizedBox(height: 16.0),
            TextFormField(
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.multiline,
              maxLines: 4,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF0A9396)),
                  borderRadius: BorderRadius.circular(10),
                ),
                labelStyle: Theme.of(context).textTheme.headline6,
                hintText: 'Enter more details',
                labelText: 'More details',
                hintStyle: Theme.of(context).textTheme.headline6,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // Added this
              ),
            ),
            const SizedBox(height: 16.0),
            imageFiles.length != 0
                ? Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.red,
                          border: Border.all(color: Color(0xFFb5b0ac)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
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
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'SUBMIT',
                style: Theme.of(context).textTheme.headline6,
              ),
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
            ),
          ]),
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
