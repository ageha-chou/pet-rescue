import 'package:flutter/material.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class SocialIcon extends StatelessWidget {
  final IconData iconSrc;
  final GestureTapCallback? press;
  const SocialIcon({
    Key? key,
    required this.iconSrc,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: ColorConstants.primary.withOpacity(0.7),
          ),
          shape: BoxShape.circle,
        ),
        child: Icon(
          iconSrc,
          size: 25,
        ),
      ),
    );
  }
}
