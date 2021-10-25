import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfile extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double addHeight = 0.03;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 20),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Form(
          //key for form
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: height * addHeight,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  child: GridTile(
                    child: Image.asset(
                      'assets/images/doctor_pic2.png',
                      width: 200,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: height * addHeight,
                ),
                TextFormField(
                    autofocus: true,
                    textInputAction: TextInputAction.done,
                    readOnly: true,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      labelText: "Full Name",
                      hintText: "Nguyen Xuan Mai Trinh",
                      labelStyle: Theme.of(context).textTheme.headline6,
                      hintStyle: Theme.of(context).textTheme.headline6,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0A9396)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your name";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: height * addHeight,
                ),
                TextFormField(
                    autofocus: true,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Phone",
                      hintText: '0773 853 338',
                      labelStyle: Theme.of(context).textTheme.headline6,
                      hintStyle: Theme.of(context).textTheme.headline6,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0A9396)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter correct phone";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: height * addHeight,
                ),
                TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Address",
                      hintText: '144 Duong Dinh Hoi, Thu Duc,\n Ho Chi Minh.',
                      hintStyle: Theme.of(context).textTheme.headline6,
                      labelStyle: Theme.of(context).textTheme.headline6,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0A9396)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter correct address";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: height * addHeight,
                ),
                TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: "Teacher",
                      hintText: 'Teacher',
                      labelStyle: Theme.of(context).textTheme.headline6,
                      hintStyle: Theme.of(context).textTheme.headline6,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF0A9396)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your job";
                      } else {
                        return null;
                      }
                    }),
                SizedBox(
                  height: height * addHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.only(bottom: 50),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.back(result: true);
                        },
                        child: Text(
                          'SAVE',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all(
                              Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
