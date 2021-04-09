import 'package:flutter_ui/common/db/user.dart';
import 'package:hive/hive.dart';

class UserAdapter extends TypeAdapter<User>{
  @override
  User read(BinaryReader reader) {
    return User(
      userId: reader.read(),
      userName: reader.read(),
      token: reader.read(),
      phone: reader.read(),
      avatarImg: reader.read()
    );
  }

  @override
  int get typeId => 0;

  @override
  void write(BinaryWriter writer, User obj) {
      writer.write(obj.userId);
      writer.write(obj.userName);
      writer.write(obj.token);
      writer.write(obj.phone);
      writer.write(obj.avatarImg);
  }
}