import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/data/roles.dart';
import 'package:pet_rescue/modules/adopter_notification/adopter_notification_item.dart';
import 'package:pet_rescue/modules/home/main_controller.dart';
import 'package:pet_rescue/modules/volunteer_report/volunteer_notification_item.dart';
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
                  'https://img.freepik.com/free-photo/friendly-smiling-woman-looking-pleased-front_176420-20779.jpg?size=626&ext=jpg&ga=GA1.2.1483557378.1620259200',
              title: 'The volunteer has canceled your report',
              icon: Icon(
                Icons.volunteer_activism,
                size: 20,
              ),
              circleColor: Colors.green[600]!,
              isNew: true,
              content: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: <TextSpan>[
                    TextSpan(text: 'The volunteer '),
                    TextSpan(
                      text: 'Volunteer name ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(text: 'has canceled your report.\n'),
                    TextSpan(text: 'Reason: ... \n'),
                    TextSpan(
                      text: '8h',
                      style: TextStyle(
                        color: ColorConstants.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AdopterNotificationItem(
              imgUrl: 'assets/images/logo.png',
              title: 'Your adopting form was approved',
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
                    TextSpan(text: 'Your adopting form for '),
                    TextSpan(
                      text: 'Pet name ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(text: 'was approved.\n'),
                    TextSpan(
                      text: '12h',
                      style: TextStyle(
                        color: ColorConstants.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AdopterNotificationItem(
              imgUrl:
                  'https://meowtel.com/img/assets/home/hero-image-cat-1.png',
              title: 'Thanks for updating pet diary',
              icon: Icon(
                Icons.announcement_rounded,
                size: 20,
              ),
              circleColor: Colors.blue[600]!,
              isNew: false,
              content: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.headline4,
                  children: <TextSpan>[
                    TextSpan(text: 'Your '),
                    TextSpan(
                      text: 'Pet Name ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(text: '\'s diary has been updated!\n'),
                    TextSpan(
                      text: '1d',
                      style: TextStyle(
                        color: ColorConstants.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            AdopterNotificationItem(
              imgUrl:
                  'https://meowtel.com/img/assets/home/hero-image-cat-1.png',
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
                      text: 'Pet Name\n',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(
                      text: '1w',
                      style: TextStyle(
                        color: ColorConstants.red,
                        fontSize: 12,
                      ),
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
                        text: 'has brought your reported abandoned pet to the '
                            'center'),
                    TextSpan(
                      text: '\n2w',
                      style: TextStyle(
                        color: ColorConstants.red,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      return RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(milliseconds: 500))
              .then((onValue) => true);
        },
        child: ListView(
          children: [
            VolunteerNotificationItem(
              imgUrl: 'https://www.linkpicture.com/q/logo_8.png',
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
                      text: 'You has cancel a report from the reporter  ',
                    ),
                    TextSpan(
                      text: 'Mai Linh ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(
                      text: '\n1 minute ago...',
                      style: TextStyle(
                        color: ColorConstants.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VolunteerNotificationItem(
              imgUrl: 'https://www.linkpicture.com/q/logo_8.png',
              title: 'Pet rescue announcement',
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
                        text: 'The new pet has been added to the Pet list. '),
                    TextSpan(
                      text: 'Let\'s check it out !!!',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(
                      text: '\n5 minutes ago...',
                      style: TextStyle(
                        color: ColorConstants.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VolunteerNotificationItem(
              imgUrl: 'https://www.linkpicture.com/q/logo_8.png',
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
                    TextSpan(text: 'Thanks for your rescue today '),
                    TextSpan(
                      text:
                          '\n The pet you was rescued will be taken care at  ',
                    ),
                    TextSpan(
                      text: 'Nhóm cứu hộ động vật SAR ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(
                      text: '\n 30 minutes ago...',
                      style: TextStyle(
                        color: ColorConstants.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            VolunteerNotificationItem(
              imgUrl: 'https://www.linkpicture.com/q/logo_8.png',
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
                      text: 'Mai Trinh ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(text: 'has confirmed you arrived '),
                    TextSpan(
                      text: 'her ',
                      style: TextStyle(color: ColorConstants.red),
                    ),
                    TextSpan(
                        text: 'destination: '
                            'Võ Thị Sáu, Quận 3 HCM'),
                    TextSpan(
                      text: '\n1 hour ago...',
                      style: TextStyle(
                        color: ColorConstants.red,
                      ),
                    ),
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
