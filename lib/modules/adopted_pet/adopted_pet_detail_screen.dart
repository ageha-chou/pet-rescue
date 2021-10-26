import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_controller.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'adopted_pet_form_controller.dart';

class AdoptedPetDetailScreen extends StatelessWidget {
  final AdoptedPet pet;

  AdoptedPetDetailScreen(this.pet);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () async {
                final controller =
                    Get.put(AdoptedPetFormController()..pet = pet);
                await Get.toNamed(Routes.ADOPTED_PET_FORM);
                Get.delete<AdoptedPetFormController>();
              },
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                Hero(
                  tag: pet.tag,
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(pet.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      // margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  pet.name,
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: Colors.red,
                                        fontSize: 24,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: [
                          buildPetFeature(pet.age, "Age", context),
                          buildPetFeature(pet.isFemale ? 'Female' : 'Male',
                              "Gender", context),
                          buildPetFeature(pet.weight, "Weight", context),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Pet Story",
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.grey[800],
                                      fontSize: 24,
                                    ),
                          ),
                          ClipOval(
                            child: Material(
                              color: ColorConstants.red.withOpacity(0.3),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(8.0),
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/images/pet-diary-black.png',
                                      color: ColorConstants.red,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildTimeline(
                      '01/10/2021',
                      'Volunteer brought to Center',
                      isFirst: true,
                    ),
                    _buildTimeline(
                      '02/10/2021',
                      '3-in-1 vaccination',
                    ),
                    _buildTimeline(
                      '08/10/2021',
                      'Adopted by Mai Trinh',
                      height: 40,
                    ),
                    _buildTimeline(
                      '24/10/2021',
                      'Dewormed',
                      height: 60,
                      isLast: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _buildTimeline(String left, String right,
      {double height = 30, bool isFirst = false, bool isLast = false}) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      indicatorStyle: IndicatorStyle(width: 15, color: ColorConstants.primary),
      beforeLineStyle: LineStyle(color: ColorConstants.red),
      alignment: TimelineAlign.manual,
      lineXY: 0.3,
      startChild: _buildLeftChild(left, height: height),
      endChild: _buildRightChild(right, height: height),
    );
  }

  _buildRightChild(String text, {double height = 30}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      alignment: Alignment.centerLeft,
      constraints: BoxConstraints(
        minHeight: height,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(Get.context!).textTheme.headline5,
      ),
    );
  }

  _buildLeftChild(String text, {double height = 50}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      alignment: Alignment.centerRight,
      constraints: BoxConstraints(
        minHeight: height,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(Get.context!).textTheme.headline5,
      ),
    );
  }

  buildPetFeature(String value, String feature, BuildContext context) {
    return Expanded(
      child: Container(
        height: 70,
        padding: EdgeInsets.all(12),
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black54,
            width: 1,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.grey[800],
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 3),
            Text(
              feature,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
