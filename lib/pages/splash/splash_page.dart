import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/global.dart';
import 'package:permission_handler_platform_interface/permission_handler_platform_interface.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  // Timer _timer;

  @override
  void initState()  async{
    // bool res = await PermissionUtil.applyPermissions((){
    //   if(Global.hasHome){
    //     Get.offNamed(Routes.home);
    //   }else{
    //     Get.offNamed(Routes.welcome);
    //   }
    //   LogUtils.GGQ('权限通过');
    // }, (not){
    //   LogUtils.GGQ('权限未通过');
    //   //权限未通过, 弹出dialog 并打开设置面板
    //   _showPermissions(not);
    // });

    super.initState();
    // _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    //   if(_timer.tick >= 1){
    //     _timer.cancel();
    //     if(Global.hasHome){
    //       Get.offNamed(Routes.home);
    //     }else{
    //       Get.offNamed(Routes.welcome);
    //     }
    //   }
    // });

    if(Global.hasHome){
      Get.offNamed(Routes.home);
    }else{
      Get.offNamed(Routes.welcome);
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.redAccent,
      ),
    );
  }


  @override
  void dispose() {
    //_timer.cancel();
    super.dispose();
  }




}

void _showPermissions(List<Permission> not) {
  //PermissionUtil.opentSetting();
  LogUtils.GGQ('_showPermissions->${not.length}');
}

