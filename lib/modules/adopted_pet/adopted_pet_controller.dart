import 'package:get/get.dart';

class AdoptedPet {
  String imageUrl;
  String name;
  String updatedDate;
  String age;
  String tag;
  String weight;
  String location;
  bool isFemale;

  AdoptedPet({
    required this.age,
    required this.imageUrl,
    required this.name,
    this.isFemale = false,
    required this.weight,
    required this.tag,
    required this.updatedDate,
    this.location = '',
  });
}

class AdoptedPetController extends GetxController {
  List<AdoptedPet> adoptedPets = [
    AdoptedPet(
      age: '1 year',
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
      age: '2 years',
      imageUrl: 'https://meowtel.com/img/assets/home/hero-image-cat-1.png',
      name: 'Tom',
      tag: '02',
      updatedDate: '5 days ago',
      weight: '5.2kg',
    ),
  ];

  List<AdoptedPet> pendingPets = [
    AdoptedPet(
      age: '4 month',
      imageUrl: 'assets/images/cats/cat_1.jpg',
      name: 'Abyssinian Cats',
      isFemale: true,
      tag: '03',
      updatedDate: '',
      location: 'Quận 3, TPHCM',
      weight: '3kg',
    ),
    AdoptedPet(
      age: '1 year',
      imageUrl: 'assets/images/dogs/dog_1.jpg',
      name: 'Affenpinscher',
      tag: '04',
      updatedDate: '',
      location: 'Quận 10, TPHCM',
      weight: '5kg',
    ),
  ];
}
