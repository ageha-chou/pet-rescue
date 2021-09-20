import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Widget _buildCard({
    required String label,
    required String imageUrl,
    required BuildContext ctx,
    VoidCallback? onTapHandler,
  }) {
    return Container(
      width: 150,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        // color: Color.fromRGBO(252, 216, 212, 1),
        // color: Theme.of(ctx).accentColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              height: 60,
              color: Color.fromRGBO(117, 108, 97, 1),
            ),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
              imageUrl: 'assets/images/diary.png',
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
            // _buildCard(
            //   label: 'List pets',
            //   imageUrl: 'assets/images/pet-list.png',
            //   ctx: context,
            // ),
          ],
        ),
      ],
    );
  }
}
