import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/widget/dialog/permissions_dialog.dart';
import 'package:flutter_ui/global.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver{
  // Timer _timer;


  @override
  void initState(){
    applyPermissions(context);
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
    WidgetsBinding.instance.removeObserver(this);
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    LogUtils.GGQ(state);
    if (state == AppLifecycleState.resumed) {
      LogUtils.GGQ('app进入前台');
      applyPermissions(context);
    } else if (state == AppLifecycleState.inactive) {
      LogUtils.GGQ('app在前台但不响应事件，比如电话，touch id等');
    } else if (state == AppLifecycleState.paused) {
      LogUtils.GGQ('app进入后台');
    } else if (state == AppLifecycleState.detached) {
      LogUtils.GGQ('没有宿主视图但是flutter引擎仍然有效');
    }
  }
}

void applyPermissions(BuildContext context) async{
  final permissionList  = await PermissionUtil.applyPermissions();
  if(permissionList.isEmpty){
    LogUtils.GGQ('全部通过');
    if(Global.hasHome){
      Get.offNamed(Routes.home);
    }else{
      Get.offNamed(Routes.welcome);
    }
  }else{
    showDialog(context: context, builder: (context) => PermissionsDialog(list: permissionList));
  }
}

