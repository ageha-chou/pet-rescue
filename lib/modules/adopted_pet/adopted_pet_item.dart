import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_controller.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_detail_screen.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_form.dart';
import 'package:pet_rescue/modules/pet_diary/pet_diary_screen.dart';
import 'package:pet_rescue/routes/app_pages.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AdoptedPetItem extends StatelessWidget {
  final AdoptedPet pet;
  bool isPending;

  AdoptedPetItem({
    required this.pet,
    this.isPending = false,
  });

  final female = Image.asset(
    'assets/images/female_icon.png',
    width: 18,
    color: Colors.pink[400],
  );

  final male = Image.asset(
    'assets/images/male_icon.png',
    width: 18,
    color: Colors.blue[400],
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => AdoptedPetDetailScreen(pet, isPending));
      },
      child: Container(
        margin: const EdgeInsets.only(
          top: 10.0,
          left: 20.0,
          right: 20.0,
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  bottomLeft: Radius.circular(10.0),
                ),
                child: Container(
                  width: 130,
                  height: 130,
                  child: Hero(
                    tag: pet.tag,
                    child: isPending
                        ? Image.asset(
                            pet.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            pet.imageUrl,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Pet name: ${pet.name}',
                              style: Theme.of(context).textTheme.headline6,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          pet.isFemale ? female : male,
                        ],
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'Age: ${pet.age}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      if (isPending) ...[
                        const SizedBox(height: 3.0),
                        Text(
                          'Location: ${pet.location}',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (pet.isApprove) return;
                                Get.to(AdoptedPetForm(), arguments: true);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: pet.isApprove
                                        ? Colors.green[300]!
                                        : ColorConstants.red,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  top: 20.0,
                                  right: 8.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  pet.isApprove ? 'Approved' : 'Submitted form',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: pet.isApprove
                                            ? Colors.green[300]
                                            : ColorConstants.red,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (!isPending) ...[
                        const SizedBox(height: 3.0),
                        Text(
                          'Last updated: ${pet.updatedDate}',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => PetDiaryScreen());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ColorConstants.red,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                                margin: const EdgeInsets.only(
                                  top: 20.0,
                                  right: 8.0,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0,
                                  vertical: 5.0,
                                ),
                                child: Text(
                                  'Pet diaries',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        color: ColorConstants.red,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
