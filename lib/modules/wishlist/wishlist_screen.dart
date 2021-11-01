import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/temp/data.dart';
import 'package:pet_rescue/temp/pet_detail.dart';

List<Pet> getWishlist() {
  return <Pet>[
    Pet("Abyssinian Cats", "California", "2.5", "Adoption", Category.CAT,
        "assets/images/cats/cat_1.jpg", true, true),
    Pet("Scottish Fold", "New Jersey", "1.2", "Mating", Category.CAT,
        "assets/images/cats/cat_2.jpg", false, false),
  ];
}

class Wishlist extends StatelessWidget {
  final list = getWishlist();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .backgroundColor,
      appBar: AppBar(
        title: Text('Wish List'),
        backgroundColor: Theme
            .of(context)
            .primaryColor,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          for (int i = 0; i < list.length; i++) _buildPetCard(list[i], context)
        ],
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget confirmButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {},
    );
    Widget cancelButton = FlatButton(
      child: Text("Cancel"),
      onPressed: () {},
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      //title: Text(""),
      content: Text("Would you like to continue removing?"),
      actions: [
        confirmButton,
        cancelButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget _buildPetCard(Pet pet, BuildContext context) {
    final String name = pet.name;
    final String location = pet.location;
    return Container(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(pet.imageUrl),
              ),
              title: Text(name),
              subtitle: Text(location),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  child: const Text('MORE DETAIL'),
                  onPressed: () {
                    Get.to(PetDetail(pet: pet));
                  },
                ),
                const SizedBox(width: 8),
                TextButton(
                  child: const Text('REMOVE'),
                  onPressed: () {
                    showAlertDialog(context);
                  },
                ),
                const SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}