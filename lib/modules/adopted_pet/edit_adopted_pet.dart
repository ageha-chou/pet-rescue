import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pet_rescue/modules/adopted_pet/edit_adopted_pet_controller.dart';

class EditAdoptedPet extends GetView<AdoptedPetFormController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text('Update pet info'),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 40,
        ),
        child: Form(
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFb5b0ac)),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                width: MediaQuery.of(context).size.width,
                height: 180,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  child: Image.network(
                    controller.pet!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: Theme.of(context).textTheme.headline6,
                controller: controller.petNameController,
                decoration: InputDecoration(
                  labelText: 'Pet name',
                  labelStyle: Theme.of(context).textTheme.headline6,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0A9396)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                style: Theme.of(context).textTheme.headline6,
                controller: controller.petWeightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Pet weight',
                  labelStyle: Theme.of(context).textTheme.headline6,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFFb5b0ac)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF0A9396)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'SAVE',
                  style: Theme.of(context).textTheme.headline6,
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
                  backgroundColor:
                      MaterialStateProperty.all(Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
