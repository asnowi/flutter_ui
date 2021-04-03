import 'package:flutter/material.dart';
import 'package:flutter_ui/common/config/index.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/global.dart';
import 'package:get/get.dart';
class WelcomePage extends StatelessWidget {

  List<Widget> _list(context) {
    return [
      welcome1,
      welcome2,
      welcome3
    ];
  }

  Widget welcome1 = Container(
    alignment: Alignment.center,
    child: Text('1',style: TextStyle(color: Colors.white,fontSize: 18,decoration: TextDecoration.none)),
    color: Colors.blue,
  );
  Widget welcome2 = Container(
    alignment: Alignment.center,
    child: Text('2',style: TextStyle(color: Colors.white,fontSize: 18,decoration: TextDecoration.none)),
    color: Colors.cyan,
  );
  Widget welcome3 = Stack(
    children: [
      Container(
        alignment: Alignment.center,
        child: Text('3',style: TextStyle(color: Colors.white,fontSize: 18,decoration: TextDecoration.none)),
        color: Colors.redAccent,
      ),
      Container(
          margin: EdgeInsets.only(bottom: 50),
          alignment: Alignment.bottomCenter,
          child: ElevatedButton (
            style: ButtonStyle(
             backgroundColor: MaterialStateProperty.all(Colors.white)),
            onPressed: (){
            Global.hasHome = true;
            StorageUtil().setBool(SaveInfoKey.HAS_HOME,true);
            Get.offNamed(Routes.home);
          }, child: Text('立即开始',style: TextStyle(color: Colors.redAccent))))
    ],
  );

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: _list(context),
    );
  }
}
