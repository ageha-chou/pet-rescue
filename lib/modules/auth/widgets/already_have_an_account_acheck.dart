import 'package:flutter/material.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final GestureTapCallback? press;
  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don’t have an Account ? " : "Already have an Account ? ",
          style: Theme.of(context).textTheme.headline5!.copyWith(
                color: ColorConstants.black,
              ),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  color: ColorConstants.red,
                ),
          ),
        )
      ],
    );
  }
}
