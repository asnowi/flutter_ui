import 'package:hive/hive.dart';

@HiveType()
class User extends HiveObject{
  String userId;
  String userName;
  String token;
  String phone;
  String avatarImg;
  String avatarBg;

  User({
    this.userId,
    this.userName,
    this.token,
    this.phone,
    this.avatarImg,
    this.avatarBg
  });
}