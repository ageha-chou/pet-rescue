import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/data/roles.dart';
import 'package:pet_rescue/modules/adopter_notification/adopter_notification_item.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AdopterNotificationList extends StatelessWidget {
  final controller = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    if (controller.user.role == Roles.adopter) {
      return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(milliseconds: 500))
              .then((onValue) => true);
        },
        child: ListView(
          children: [
            AdopterNotificationItem(
              imgUrl:
                  'https://www.rd.com/wp-content/uploads/2021/04/GettyImages-988013222-scaled-e1618857975729.jpg',
              title: 'Update pet diary reminding',
              icon: Icon(
                Icons.announcement_rounded,
                size: 20,
              ),
              circleColor: Colors.blue[600]!,
              isNew: true,
              content: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: <TextSpan>[
                    TextSpan(
                        text: 'You are late 2 days for updating your pet '
                            'diary of '),
                    TextSpan(
                      text: 'Pet Name',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                  ],
                ),
              ),
            ),
            AdopterNotificationItem(
              imgUrl:
                  'https://img.freepik.com/free-photo/friendly-smiling-woman-looking-pleased-front_176420-20779.jpg?size=626&ext=jpg&ga=GA1.2.1483557378.1620259200',
              title: 'Pet rescue announcement',
              icon: Icon(
                Icons.volunteer_activism,
                size: 20,
              ),
              circleColor: Colors.green[600]!,
              isNew: false,
              content: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Volunteer ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(
                        text: 'has brought your reported abandoned pete to the '
                            'center'),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
