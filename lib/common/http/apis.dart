import 'package:flutter_ui/common/config/config.dart';

class Apis {
  //url 前缀
  static const String apiPrefix = Config.BASE_URL;

  //登录接口
  static String login = apiPrefix+'/login/cellphone';
  static String test = apiPrefix+'/user/detail';

}


