import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pet_rescue/screens/home_screen.dart';
import 'package:pet_rescue/screens/test_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  bool _isVolunteer = false;

  int _selectedScreenIndex = 0;

  void _onSelectPage(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  String get user {
    return _isVolunteer ? 'Volunteer' : 'Normal User';
  }

  Widget _buildNavButton(
      {required String label,
      required String imageUrl,
      required int index,
      VoidCallback? onPressHandler}) {
    return TextButton(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
      ),
      onPressed: onPressHandler,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            imageUrl,
            color: _selectedScreenIndex == index
                ? const Color.fromRGBO(19, 44, 51, 1)
                : const Color.fromRGBO(19, 44, 51, 0.45),
            height: 32,
          ),
          SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              color: _selectedScreenIndex == index
                  ? Colors.white70
                  : Colors.black26,
              fontSize: 12.5,
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/logo.png',
                color: Color.fromRGBO(19, 44, 51, 1),
                height: 60,
              ),
              // Text(pages[_selectedScreenIndex]['title'] as String),
            ],
          ),
          Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
                foregroundColor: Color.fromRGBO(19, 44, 51, 1),
              ),
              SizedBox(width: 5),
              Text(
                user,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>> pages = [
      {'page': HomeScreen(_isVolunteer), 'title': 'Home'},
      {'page': TestScreen('Adopted Pets'), 'title': 'Adopted Pets'},
      {'page': TestScreen('Notifications'), 'title': 'Notifications'},
      {'page': TestScreen('Info'), 'title': 'Info'},
    ];

    return Scaffold(
      appBar: appBar(),
      backgroundColor: Theme.of(context).backgroundColor,
      body: pages[_selectedScreenIndex]['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        // color: Color.fromRGBO(246, 225, 225, 1),
        color: Theme.of(context).accentColor,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavButton(
                label: 'Home',
                index: 0,
                imageUrl: 'assets/images/home.png',
                onPressHandler: () {
                  _onSelectPage(0);
                }),
            _buildNavButton(
                label: 'Adopted Pets',
                index: 1,
                imageUrl: 'assets/images/paw.png',
                onPressHandler: () {
                  _onSelectPage(1);
                }),
            SizedBox(width: 55),
            _buildNavButton(
                label: 'Notifications',
                index: 2,
                imageUrl: 'assets/images/notifications.png',
                onPressHandler: () {
                  _onSelectPage(2);
                }),
            _buildNavButton(
                label: 'Me',
                index: 3,
                imageUrl: 'assets/images/person.png',
                onPressHandler: () {
                  _onSelectPage(3);
                }),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: FittedBox(
          child: FloatingActionButton(
            elevation: 4,
            backgroundColor: const Color.fromRGBO(210, 88, 88, 0.8),
            child: Image.asset(
              'assets/images/help.png',
              color: const Color.fromRGBO(255, 245, 238, 0.9),
              height: 50,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
