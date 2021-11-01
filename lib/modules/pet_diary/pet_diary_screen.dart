import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pet_rescue/modules/report/report_pet_screen.dart';

import 'add_diary_screen.dart';

class PetDiaryScreen extends StatelessWidget {
  const PetDiaryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Pet Diary'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          _buildDiaryCard("10/30/2021", "Sushi",
              "https://www.collinsdictionary.com/images/full/dog_230497594.jpg"),
          _buildDiaryCard("10/29/2021", "Mit",
              "https://www.chamsocpet.com/wp-content/uploads/2020/10/cho-co-the-bi-chan-nan-hay-khong-5.jpg"),
          _buildDiaryCard("10/28/2021", "Mit",
              "https://www.chamsocpet.com/wp-content/uploads/2020/10/cho-co-the-bi-chan-nan-hay-khong-5.jpg"),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddDiary()),
        tooltip: 'Create New Diary',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildDiaryCard(String date, String name, String imgUrl) {
    return Container(
      child: Card(
        child: InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(imgUrl),
            ),
            title: Text(name),
            subtitle: Text(date),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              tooltip: "Delete",
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
