import 'package:hive/hive.dart';
import 'package:sample_app/models/User.dart';

class Boxes {
  static Box<User> getUsers() => Hive.box<User>("users");
}
