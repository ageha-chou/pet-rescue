import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/volunteer_report/pet_waiting_screen.dart';
import 'package:pet_rescue/modules/volunteer_report/report_form.dart';


class PetReport extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Pet report'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildNotificationCard(
              'SOME PET NEEDS YOUR HELP', 'Võ Thị Sáu, Quận 3 HCM', context),
          _buildNotificationCard(
              'SOME PET NEEDS YOUR HELP', 'Võ Thị Sáu, Quận 3 HCM', context),
          _buildNotificationCard(
              'SOME PET NEEDS YOUR HELP', 'Võ Thị Sáu, Quận 3 HCM', context),
          _buildNotificationCard(
              'SOME PET NEEDS YOUR HELP', 'Võ Thị Sáu, Quận 3 HCM', context),
        ],
      ),
    );
  }
//$duration min

  // Widget buildContainer(String title) {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: Colors.white,
  //         border: Border.all(color: Colors.grey),
  //         borderRadius: BorderRadius.circular(10)),
  //     margin: EdgeInsets.all(10),
  //     padding: EdgeInsets.all(10),
  //     height: 150,
  //     width: 300,
  //     child: buildNotificationCard(title, urlImage),
  //   );
}

Widget _buildNotificationCard(
    String _title, String _subTitle, BuildContext context) {
  Dialog errorDialog = Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: 500.0,
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network("https://bom.to/ZiKclZ"),
              )
              ),
          Padding(padding: EdgeInsets.only(top: 5.0)),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    Icons.location_on,
                    semanticLabel: _subTitle,
                  ),
                ],
              ),
            ],
          ),
          const Divider(),
          TextButton(
              style: ButtonStyle(),
              child: const Text('Accept', style: TextStyle(fontSize: 18.0)),
              onPressed: () => Get.to(() => WaitingPetScreen()),
            ),
          const Divider(
            thickness: 2,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.red, fontSize: 18.0),
              )),
        ],
      ),
    ),
  );

  return Container(
    child: Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage("https://bom.to/p3CUfC", scale: 22),
            ),
            title: Text('SOME PET NEEDS YOUR HELP'),
            subtitle: Text('Võ Thị Sáu, Quận 3 HCM'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                  style: ButtonStyle(),
                  child: const Text('ACCEPT'),
                  onPressed: () => Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => WaitingPetScreen()),
                        (Route<dynamic> route) => false,
                  ),
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('DECLINE'),
                onPressed: () {/* ... */},
              ),
              const SizedBox(width: 8),
              TextButton(
                child: const Text('MORE DETAIL'),
                onPressed: () {
                  Get.to(ReportForm());
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
        ],
      ),
    ),
  );
}
