import 'package:hive/hive.dart';

part 'user_info_model.g.dart';

@HiveType(typeId: 1)
class UserInfo extends HiveObject {
  @HiveField(0)
  String? username;

  @HiveField(1)
  final String password;

  @HiveField(2)
  final String mail;

  UserInfo(
      {required this.username, required this.password, required this.mail});
}
