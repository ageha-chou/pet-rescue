import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/auth/sign_in/sign_in_screen.dart';
import 'package:pet_rescue/modules/auth/sign_in/widgets/background.dart';
import 'package:pet_rescue/modules/auth/widgets/already_have_an_account_acheck.dart';
import 'package:pet_rescue/modules/auth/widgets/rounded_button.dart';
import 'package:pet_rescue/modules/auth/widgets/rounded_input_field.dart';
import 'package:pet_rescue/modules/auth/widgets/rounded_password_field.dart';

import 'widgets/or_divider.dart';
import 'widgets/social_icon.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "SIGNUP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.22,
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "SIGNUP",
                press: () {},
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () {
                  Get.offAll(() => SignInScreen());
                },
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocialIcon(
                    iconSrc: FontAwesomeIcons.facebook,
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: FontAwesomeIcons.twitter,
                    press: () {},
                  ),
                  SocialIcon(
                    iconSrc: FontAwesomeIcons.google,
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
