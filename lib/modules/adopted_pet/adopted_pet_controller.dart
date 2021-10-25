import 'package:get/get.dart';

class AdoptedPet {
  String imageUrl;
  String name;
  String updatedDate;
  String age;
  String tag;
  String weight;
  bool isFemale;

  AdoptedPet({
    required this.age,
    required this.imageUrl,
    required this.name,
    this.isFemale = false,
    required this.weight,
    required this.tag,
    required this.updatedDate,
  });
}

class AdoptedPetController extends GetxController {
  List<AdoptedPet> adoptedPets = [
    AdoptedPet(
      age: '1 year old',
      imageUrl: 'https://i.natgeofe'
          '.com/n/f0dccaca-174b-48a5-b944-9bcddf913645/01-cat'
          '-questions-nationalgeographic_1228126_4x3.jpg',
      name: 'Susu',
      isFemale: true,
      tag: '01',
      updatedDate: '1 day ago',
      weight: '3.5kg',
    ),
    AdoptedPet(
      age: '2 years old',
      imageUrl: 'https://meowtel.com/img/assets/home/hero-image-cat-1.png',
      name: 'Tom',
      tag: '02',
      updatedDate: '5 days ago',
      weight: '5.2kg',
    ),
  ];
}
