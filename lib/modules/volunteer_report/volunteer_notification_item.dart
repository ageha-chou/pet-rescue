import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class VolunteerNotificationItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final Widget content;
  final Widget icon;
  final Color circleColor;
  final String petName = 'Su Su';
  final bool isNew;

  VolunteerNotificationItem({
    required this.imgUrl,
    required this.title,
    required this.content,
    required this.icon,
    required this.circleColor,
    required this.isNew,
  });

  _getImage(String url) {
    return imgUrl.contains('http') ? NetworkImage(imgUrl) : AssetImage(imgUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isNew ? Colors.grey[200] : Theme.of(context).backgroundColor,
        border: Border(
          bottom: BorderSide(width: 0.2),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
      ),
      // margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(
                  left: 20.0,
                  right: 10.0,
                ),
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: _getImage(imgUrl),
                  ),
                ),
              ),
              Positioned(
                right: 3,
                bottom: 3,
                child: PhysicalModel(
                  color: Colors.transparent,
                  elevation: 15.0,
                  shape: BoxShape.circle,
                  child: CircleAvatar(
                    child: icon,
                    backgroundColor: circleColor,
                    radius: 15,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline6,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                content,
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            padding: const EdgeInsets.only(
              top: 15.0,
            ),
            child: Icon(
              FontAwesomeIcons.ellipsisH,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
