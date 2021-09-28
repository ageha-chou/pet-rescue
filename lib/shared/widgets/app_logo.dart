import 'package:flutter/material.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AppLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.png',
      color: ColorConstants.black,
      height: 60,
    );
  }
}
