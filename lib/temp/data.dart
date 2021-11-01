enum Category { CAT, DOG, BUNNY, HAMSTER }
enum Condition { Adoption, Disappear, Mating }

class Pet {
  String name;
  String location;
  String distance;
  String condition;
  Category category;
  String imageUrl;
  bool favorite;
  bool newest;

  Pet(this.name, this.location, this.distance, this.condition, this.category, this.imageUrl, this.favorite, this.newest);

}

List<Pet> getPetList(){
  return <Pet>[
    Pet("Abyssinian Cats", "Quận 3, HCM", "2.5", "Active", Category.CAT, "assets/images/cats/cat_1.jpg", false, true),
    Pet("Scottish Fold", "Quận 7, HCM", "1.2", "Non-sporting", Category.CAT, "assets/images/cats/cat_2.jpg", false, false),
    Pet("Ragdoll", "Hồ Chí Minh", "1.2", "Human-friendly", Category.CAT, "assets/images/cats/cat_3.jpg", true, false),
    Pet("Burmés", "Quân 5, HCM", "1.2", "Adaptable", Category.CAT, "assets/images/cats/cat_4.jpg", false, true),
    Pet("American Shorthair", "Quận 3, HCM", "1.2", "Family friendly", Category.CAT, "assets/images/cats/cat_5.jpg", true, false),
    Pet("British Shorthair", "Quân 5, HCM", "1.9", "Sweet tempered", Category.CAT, "assets/images/cats/cat_6.jpg", true, false),
    Pet("Abyssinian Cats", "Quận 7, HCM", "2.5", "Playful", Category.CAT, "assets/images/cats/cat_7.jpg", true, false),
    Pet("Scottish Fold", "Quận 3, HCM", "1.2", "Easy Going", Category.CAT, "assets/images/cats/cat_8.jpg", true, false),
    Pet("Ragdoll", "Quận 1, HCM", "1.2", "East a lot", Category.CAT, "assets/images/cats/cat_9.jpg", false, true) ,

    Pet("Affenpinscher", "Quân 5, HCM", "2.5", "Active", Category.DOG, "assets/images/dogs/dog_1.jpg", false, true),
    Pet("Akita Shepherd", "Quận 3, HCM", "2.5", "Indulgent", Category.DOG, "assets/images/dogs/dog_2.jpg", false, false),
    Pet("American Foxhound", "Quân 5, HCM", "2.5", "Intelligence", Category.DOG, "assets/images/dogs/dog_3.jpg", true, false),
    Pet("Shepherd Dog", "Quận 1, HCM", "2.5", "Sociable", Category.DOG, "assets/images/dogs/dog_4.jpg", true, true),
    Pet("Australian Terrier", "Quận 1, HCM", "2.5", "Eco-friendly", Category.DOG, "assets/images/dogs/dog_5.jpg", true, false),
    Pet("Bearded Collie", "Quận 1, HCM", "2.5", "Active", Category.DOG, "assets/images/dogs/dog_6.jpg", false, false),
    Pet("Belgian Sheepdog", "Quân 5, HCM", "2.5", "Sociable", Category.DOG, "assets/images/dogs/dog_7.jpg", true, false),
    Pet("Bloodhound", "Quận 3, HCM", "2.5", "Standoffish", Category.DOG, "assets/images/dogs/dog_8.jpg", true, true),
    Pet("Boston Terrier", "Quận 7, HCM", "2.5", "Naughty", Category.DOG, "assets/images/dogs/dog_9.jpg", false, true),
    Pet("Chinese Shar-Pei", "Quận 1, HCM", "2.5", "Friendly", Category.DOG, "assets/images/dogs/dog_10.jpg", false, false),
    Pet("Border Collie", "Quân 5, HCM", "2.5", "Family-", Category.DOG, "assets/images/dogs/dog_11.jpg", false, false),
    Pet("Chow Chow", "Quận 3, HCM", "2.5", "Friendly", Category.DOG, "assets/images/dogs/dog_12.jpg", false, true),
  ];
}