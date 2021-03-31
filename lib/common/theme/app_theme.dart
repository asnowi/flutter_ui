import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
    primaryColor: Colors.red,
    accentColor: Colors.redAccent,
    fontFamily: 'SourceHanSans',
    appBarTheme: _appbarTheme(),
   // buttonBarTheme: _buttonBarThemeData(),
    textTheme: TextTheme(
      headline1: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'SourceHanSans'),
    ),
    textButtonTheme: TextButtonThemeData(style: _buttonStyle()),
   //  elevatedButtonTheme: ElevatedButtonThemeData(style: _buttonStyle()),
   //  outlinedButtonTheme: OutlinedButtonThemeData(style: _buttonStyle())
);

AppBarTheme _appbarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    textTheme: TextTheme(
      headline6: TextStyle(color: Colors.black, fontSize: 18),
    ),
    iconTheme: IconThemeData(color: Colors.black),
  );
}

ButtonBarThemeData _buttonBarThemeData(){
  return ButtonBarThemeData(

  );
}

ButtonStyle _buttonStyle() {
  return ButtonStyle(
      backgroundColor: MaterialStateProperty.resolveWith((states) {
    //设置按下时的背景颜色
    if (states.contains(MaterialState.pressed)) {
      return Colors.grey[200];
    }
    //默认不使用背景颜色
    // return null;
    return Colors.white;
  }), foregroundColor: MaterialStateProperty.resolveWith((states) {
    if (states.contains(MaterialState.focused) && !states.contains(MaterialState.pressed)) {
      //获取焦点时的颜色
      return Colors.blue;
    } else if (states.contains(MaterialState.pressed)) {
      //按下时的颜色
      return Colors.black12;
    }
    //默认状态使用灰色
    return Colors.white;
  }));
}
