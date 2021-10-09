import 'package:pet_rescue/data/roles.dart';

class User {
  String phone;
  String password;
  String fullName;
  Roles role;

  User({
    required this.phone,
    required this.password,
    required this.fullName,
    required this.role,
  });

  String get username {
    List<String> nameParts = fullName.split(" ");
    int length = nameParts.length;
    return nameParts[length - 2] + " " + nameParts[length - 1];
  }
}
