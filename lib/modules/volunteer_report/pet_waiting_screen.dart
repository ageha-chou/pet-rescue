import 'dart:async';
import 'package:get/get.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pet_rescue/modules/volunteer_report/pet_confirm_screen.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class WaitingPetScreen extends StatefulWidget {
  @override
  _WaitingPetScreenState createState() => _WaitingPetScreenState();
}

class _WaitingPetScreenState extends State<WaitingPetScreen> {
  bool _isButtonDisabled = false;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      _isButtonDisabled = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(),
        backgroundColor: ColorConstants.teal,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo here
              Icon(
                Icons.add_location_sharp,
                size: 12 * 12,
                color: ColorConstants.otherRed,
              ),
              SizedBox(height: 20),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'The Pet is waiting...',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: StadiumBorder(),
                  primary: ColorConstants.otherRed,
                  onPrimary: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('Confirm'),
                onPressed: () => {Get.to(() => ConfirmingPickingPet())},
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(String title) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: Image.asset(
          'assets/images/bunnies/bunny_2.jpg',
          height: 150,
          width: 300,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  // final ElevatedButton editButton;

  // Button(this.editButton);
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: StadiumBorder(),
          primary: ColorConstants.otherRed,
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text('Confirm'),
        onPressed: () => Get.to(() => ConfirmingPickingPet()));
  }
}
