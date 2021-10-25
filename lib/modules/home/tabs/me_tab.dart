import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pet_rescue/modules/me/user_profile.dart';

class MeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: UserProfile(),
    );
  }
}
