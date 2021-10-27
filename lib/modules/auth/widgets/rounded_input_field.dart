import 'package:flutter/material.dart';
import 'package:pet_rescue/modules/auth/widgets/text_field_container.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: ColorConstants.primary,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorConstants.black,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
