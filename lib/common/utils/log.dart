import 'package:flutter_ui/global.dart';

class LogUtils {
  static bool _isLog = Global.isRelease;

  static void GGQ(Object msg) {
    if(!_isLog){
      StringBuffer sb = new StringBuffer();
      sb.write('GGQ->:');
      sb.write(msg);
      print(sb.toString());
    }
  }
}