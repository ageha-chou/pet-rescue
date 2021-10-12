import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/pets_list/pet_list_controller.dart';
import 'package:pet_rescue/modules/pets_list/widgets/buttons.dart';

class PetsListScreen extends StatelessWidget {

 
  
  @override
  Widget build(BuildContext context) {
    final PestListController controller = Get.put(PestListController(context: context));
    double one_screen_h = MediaQuery.of(context).size.height * 0.01;
    double one_screen_w = MediaQuery.of(context).size.width * 0.01;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle:  true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back), color: Colors.teal,
          onPressed: () {},
        ),
        title: Text(
            'Pick-up',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 20.0,
            color: Colors.black,
          ),
        ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none, color: Colors.red.shade300),
              onPressed: (){},
            ),
          ]
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: one_screen_w * 100,
                height: one_screen_h * 45,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(55),
                  )
                )
              ),
            ),
            Positioned(
              top: 10 * one_screen_h,
                left: 4 * one_screen_w,

                child: Icon(
                  Icons.menu,
                  size: one_screen_w * 10,
                  color: Colors.orange,

                ) ),
            Positioned(
              top: 18 * one_screen_h,
                left: 5 * one_screen_w,

                child: Text("Shelter",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.pink,
                  fontWeight: FontWeight.w600,
                ),)
            ),
            Positioned(
              top: 18 * one_screen_h,
                left: 5 * one_screen_w,

                child: Container(
                  width: 90*one_screen_w,
                  child: TextField(
                    style: TextStyle(
                      fontSize: 21, fontWeight: FontWeight.w800,
                    ),
                    decoration: InputDecoration(
                      hintText: 'By the nearest',
                    ),
                  ),
                ),
            ),
            Positioned(
                top: 21 * one_screen_h,
                right: 5 * one_screen_w,
                child: Icon(Icons.location_on)),
            Positioned(
                top: 28 * one_screen_h,
                left: 5 * one_screen_w,
                child: Text('Type',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    )
                ),
            ),

          ]
        ),
      ),
    );
  }


}
