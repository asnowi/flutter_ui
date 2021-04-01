import 'package:get/get.dart';

class Toast{
  static show(final String s){
    Get.snackbar('提示：', s);
  }
}