import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_controller.dart';
import 'package:pet_rescue/modules/adopted_pet/adopted_pet_detail_screen.dart';
import 'package:pet_rescue/shared/constants/color.dart';

class AdoptedPetItem extends StatelessWidget {
  final AdoptedPet pet;

  AdoptedPetItem({
    required this.pet,
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
        Get.to(() => AdoptedPetDetailScreen(pet));
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
                    child: Image.network(
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
                          Text(
                            'Pet name: ${pet.name}',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          pet.isFemale ? female : male,
                        ],
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'Age: ${pet.age}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(height: 3.0),
                      Text(
                        'Last updated: ${pet.updatedDate}',
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
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
                        ],
                      ),
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
