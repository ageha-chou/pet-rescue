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
}
