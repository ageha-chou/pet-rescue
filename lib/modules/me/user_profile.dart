import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/shared/constants/color.dart';

import 'volunteer_edit_profile.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset("assets/images/doctor_pic2.png", height: 220),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 222,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Nguyen Xuan Mai Trinh",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontSize: 25,
                            ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(Icons.work, size: 20, color: Colors.grey),
                          const SizedBox(width: 5),
                          Text(
                            'Teacher',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: <Widget>[
                          IconTile(
                            backColor: Color(0xffFFECDD),
                            imgAssetPath: "assets/images/email.png",
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconTile(
                            backColor: Color(0xffFEF2F0),
                            imgAssetPath: "assets/images/call.png",
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 26,
            ),
            // Text(
            //   "About",
            //   style: TextStyle(fontSize: 22),
            // ),
            // SizedBox(
            //   height: 16,
            // ),
            // Text(
            //   "I love pet. I believe that they're deserve to have a better life !!!",
            //   style: TextStyle(color: Colors.grey, fontSize: 16),
            // ),
            // SizedBox(
            //   height: 24,
            // ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Image.asset("assets/images/mappin.png"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Address",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 18,
                                  ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 268,
                              child: Text(
                                "144 Duong Dinh Hoi, Thu Duc,\nHo Chi Minh.",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Image.asset("assets/images/clock.png"),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Available time",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    color: Colors.black87.withOpacity(0.7),
                                    fontSize: 18,
                                  ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width - 268,
                              child: Text(
                                'Monday - Friday\n 17h30 - 23h',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/map.png",
                  width: 180,
                )
              ],
            ),
            Text(
              "Activity",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Color(0xff242424),
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            SizedBox(
              height: 22,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Color(0xffFBB97C),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xffFCCA9B),
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset("assets/images/list.png")),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 130,
                          child: Text(
                            "List Of report",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                    decoration: BoxDecoration(
                        color: Color(0xffA5A5A5),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Color(0xffBBBBBB),
                                borderRadius: BorderRadius.circular(16)),
                            child: Image.asset("assets/images/list.png")),
                        SizedBox(
                          width: 16,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 130,
                          child: Text(
                            "List of rescued pets",
                            style: Theme.of(context)
                                .textTheme
                                .headline5!
                                .copyWith(color: Colors.white, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            Container(
              constraints: BoxConstraints(maxWidth: 340.0, minHeight: 50.0),
              margin: EdgeInsets.all(10),
              child: RaisedButton(
                onPressed: () {
                  Get.to(EditProfile());
                },
                splashColor: ColorConstants.primary,
                color: ColorConstants.primary.withOpacity(0.8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Edit Profile',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}

class IconTile extends StatelessWidget {
  final String imgAssetPath;
  final Color backColor;

  IconTile({required this.imgAssetPath, required this.backColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 16),
      child: Container(
        height: 45,
        width: 45,
        decoration: BoxDecoration(
            color: backColor, borderRadius: BorderRadius.circular(15)),
        child: Image.asset(
          imgAssetPath,
          width: 20,
        ),
      ),
    );
  }
}
