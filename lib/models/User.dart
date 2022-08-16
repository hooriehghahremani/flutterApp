import 'package:hive/hive.dart';

part 'User.g.dart';
@HiveType(typeId: 0)
class User extends HiveObject {
  User(
      {required this.firstName,
      required this.lastName,
      required this.age,
      required this.username,
      required this.password});

  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  int age;
  @HiveField(3)
  String username;
  @HiveField(4)
  String password;
}
