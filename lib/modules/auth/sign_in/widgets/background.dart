import 'package:flutter/material.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/auth/main_top.png",
              color: ColorConstants.primary.withOpacity(0.6),
              width: size.width * 0.35,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(
              "assets/images/auth/login_bottom.png",
              color: ColorConstants.red.withOpacity(0.5),
              width: size.width * 0.4,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
