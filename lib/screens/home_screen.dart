import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final bool isVolunteer;

  HomeScreen(this.isVolunteer);

  Widget _buildCard({
    required String label,
    required String imageUrl,
    required BuildContext ctx,
    VoidCallback? onTapHandler,
  }) {
    return Container(
      width: 150,
      height: 150,
      margin: EdgeInsets.all(5),
      child: Column(
        children: <Widget>[
          Container(
            width: 120,
            height: 120,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.all(10),
              elevation: 5,
              // color: Color.fromRGBO(252, 216, 212, 1),
              // color: Theme.of(ctx).accentColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  imageUrl,
                  height: 60,
                  color: Color.fromRGBO(117, 108, 97, 1),
                ),
              ),
            ),
          ),
          SizedBox(height: 2),
          FittedBox(
            child: Text(
              label,
              style: Theme.of(ctx).textTheme.headline6,
              softWrap: true,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              label: 'List Pets',
              imageUrl: 'assets/images/pet-list.png',
              ctx: context,
            ),
            _buildCard(
              label: 'Pet Diaries',
              imageUrl: 'assets/images/pet-diary.png',
              ctx: context,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCard(
              label: 'Wish List',
              imageUrl: 'assets/images/wish-list.png',
              ctx: context,
            ),
            isVolunteer
                ? _buildCard(
                    label: 'Pet Reports',
                    imageUrl: 'assets/images/report.png',
                    ctx: context,
                  )
                : _buildCard(
                    label: 'Become a Volunteer',
                    imageUrl: 'assets/images/volunteer.png',
                    ctx: context,
                  ),
          ],
        ),
      ],
    );
  }
}
