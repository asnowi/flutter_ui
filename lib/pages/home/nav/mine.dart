import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/common/config/index.dart';
import 'package:flutter_ui/common/db/index.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/global.dart';
import 'package:flutter_ui/pages/home/view/unlogin.dart';

class PageMine extends StatefulWidget {
  @override
  _PageMineState createState() => _PageMineState();
}

class _PageMineState extends State<PageMine> {

  MineController mineController = Get.put(MineController());

  StreamSubscription<CommonEvent> _subscription;
  User _user;


  @override
  void initState() {
    super.initState();
    _user = Global.dbUtil.getCurrentUser();
    _subscription = EventBusUtils.listen((event) {
      LogUtils.GGQ('event:${event.code}');
      if(event.code == EventCode.EVENT_LOGIN){
        mineController.onChange(true);
      }
    });
  }

  @override
  void dispose() {
    if(_subscription != null){
      _subscription.cancel();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      alignment: Alignment.center,
      child: Obx(() => mineController.isLogin.value? _buildMine():_buildUnLogin()),
    );
  }

  Widget _buildUnLogin() {
    return UnLogin();
  }

  Widget _buildMine() {
    return Text('mine');
  }
}


class MineController extends GetxController{
  var isLogin = false.obs;

  onChange(bool b){
    this.isLogin.value = b;
  }
}


