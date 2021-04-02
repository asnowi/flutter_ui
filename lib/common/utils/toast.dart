import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Toast{
  static show(final String s){
    Get.snackbar('', s,duration: Duration(milliseconds: 1200),titleText: Text('提示',style: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'FZFWQingYinTiJWL',
    ),),messageText: Text(s,style: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'FZFWQingYinTiJWL',
    ),));
  }
}