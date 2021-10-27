import 'package:flutter/material.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: ColorConstants.primary.withOpacity(0.4),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
