import 'package:flutter/material.dart';
import 'package:pet_rescue/shared/constants/color.dart';

import 'text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: ColorConstants.primary,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: ColorConstants.black,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: ColorConstants.black,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
