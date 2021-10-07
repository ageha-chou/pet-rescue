import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/home/main_screen.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class ConfirmingPickingPet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo here
              Icon(
                Icons.check_circle,
                size: 12 * 12,
                color: ColorConstants.black,
              ),
              SizedBox(height: 10),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Your pet was safe now !!!',
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
                  primary: ColorConstants.teal,
                  onPrimary: Colors.teal,
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('Back'),
                onPressed: () => {
                  Get.to(() => MainScreen())
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Icon(
// Icons.check_circle,
// size: 10 * 10,
// ),

// ElevatedButton(
// style: ElevatedButton.styleFrom(
// elevation: 10,
// shape: StadiumBorder(),
// primary: ColorConstants.teal,
// onPrimary: Colors.white,
// padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
// ),
// child: Text('Back'),
// onPressed: () => {Get.to(MainScreen())},
// ),