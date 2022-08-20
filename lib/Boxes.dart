import 'package:hive/hive.dart';
import 'package:sample_app/user_info_model.dart';

class Boxes {
  static Box<UserInfo> getUserInfo() => Hive.box<UserInfo>("UserInfo");
}
