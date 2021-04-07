import 'package:hive/hive.dart';

@HiveType(typeId: 1)
class User extends HiveObject{
  String userId;
  String userName;
  String token;
  String phone;
  String avatarImg;

  User({
    this.userId,
    this.userName,
    this.token,
    this.phone,
    this.avatarImg,
  });
}