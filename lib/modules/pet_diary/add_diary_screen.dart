import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'date-time-field/my-textfield-date-picker.dart';

class AddDiary extends StatefulWidget {
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<AddDiary> {
  int _value = 1;
  String? _currentSelectedValue;
  DateTime selectedDate = DateTime.now();
  TextEditingController _textEditingController = TextEditingController();

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
            InputDecorator(
              baseStyle: Theme.of(context).textTheme.headline6,
              decoration: InputDecoration(
                  labelText: 'Pet',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
              //isEmpty: _currentSelectedValue == 'Please choose your pet',
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                    hint: Text('Choose your pet'),
                    value: _currentSelectedValue,
                    isDense: true,
                    style: Theme.of(context).textTheme.headline6,
                    items: [
                      DropdownMenuItem(
                        child: Text("Sushi"),
                        value: "Sushi",
                      ),
                      DropdownMenuItem(
                        child: Text("Mit"),
                        value: "Mit",
                      ),
                      DropdownMenuItem(
                        child: Text("Gau"),
                        value: "Gau",
                      )
                    ],
                    onChanged: (String? newValue) {
                      setState(() {
                        _currentSelectedValue = newValue!;
                      });
                    }),
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            MyTextFieldDatePicker(
              labelText: "Date",
              dateFormat: DateFormat("yyyy-MM-dd"),
              /*prefixIcon: Icon(Icons.date_range),
              suffixIcon: Icon(Icons.arrow_drop_down),*/
              lastDate: DateTime.now().add(Duration(days: 366)),
              firstDate: DateTime.now(),
              initialDate: DateTime.now().add(Duration(days: 1)),
              onDateChanged: (selectedDate) {
                // Do something with the selected date
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              style: Theme.of(context).textTheme.headline6,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  labelText: 'Main activity',
                  hintText: 'Enter main activity'),
            ),
            SizedBox(
              height: 16.0,
            ),
            TextField(
                style: Theme.of(context).textTheme.headline6,
                keyboardType: TextInputType.multiline,
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  //labelText: 'More details',
                  hintText: 'Enter more details',
                  // Added this
                ),
              ),

            SizedBox(
              height: 16.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFb5b0ac)),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              width: MediaQuery.of(context).size.width,
              height: 130,
              child : Center (
                child : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      size: 45,
                      color: Color(0xFFb5b0ac),
                    ),
                    Text(
                      'Upload image',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                )
              )
            ),
            SizedBox(
              height: 16.0,
            ),
            ElevatedButton(
              onPressed: () {
                //Get.back()
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
          ]),
        ),
      ),
    );
  }
}
