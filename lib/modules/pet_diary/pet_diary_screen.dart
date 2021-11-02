import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:pet_rescue/modules/pet_diary/pet_diary_controller.dart';
import 'package:pet_rescue/modules/pet_diary/pet_diary_details_screen.dart';

import 'add_diary_screen.dart';

class PetDiaryScreen extends GetView<PetDiaryController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Pet Diary'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: controller.petDiaries.length,
            itemBuilder: (ctx, i) {
              PetDiary diary = controller.petDiaries[i];
              return _buildDiaryCard(
                diary.updatedDate,
                diary.name,
                diary.imageUrl,
                () => Get.to(
                  () => PetDiaryDetailsScreen(controller.petDiaries[i]),
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () => Get.to(() => AddDiary()),
              tooltip: 'Create New Diary',
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDiaryCard(
      String date, String name, String imgUrl, VoidCallback onTapHandler) {
    return Container(
      child: Card(
        child: InkWell(
          onTap: onTapHandler,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(imgUrl),
            ),
            title: Text(name),
            subtitle: Text(date),
            trailing: IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.red,
              ),
              tooltip: "Delete",
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
