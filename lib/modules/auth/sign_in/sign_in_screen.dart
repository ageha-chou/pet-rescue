import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/auth/sign_in/widgets/background.dart';
import 'package:pet_rescue/modules/auth/sign_up/sign_up_screen.dart';
import 'package:pet_rescue/modules/auth/widgets/already_have_an_account_acheck.dart';
import 'package:pet_rescue/modules/auth/widgets/rounded_button.dart';
import 'package:pet_rescue/modules/auth/widgets/rounded_input_field.dart';
import 'package:pet_rescue/modules/auth/widgets/rounded_password_field.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset(
                "assets/images/logo.png",
                height: size.height * 0.22,
              ),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              Container(
                margin: EdgeInsets.only(right: 25),
                width: size.width * 0.8,
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot password?',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: ColorConstants.red,
                      ),
                ),
              ),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Get.offAndToNamed(Routes.HOME);
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Get.offAll(() => SignUpScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
