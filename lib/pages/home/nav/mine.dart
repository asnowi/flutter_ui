import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
  final _user = User().obs;


  @override
  void initState() {
    super.initState();
    _user.value = Global.dbUtil.getCurrentUser();
    _subscription = EventBusUtils.listen((event) {
      LogUtils.GGQ('event:${event.code}');
      if(event.code == EventCode.EVENT_LOGIN){
        _user.value = mineController.onGetUser();
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
      color: Colors.white,
      alignment: Alignment.center,
      child: Obx(() => _user.value == null? _buildUnLogin():_buildMine()),
    );
  }

  Widget _buildUnLogin() {
    return UnLogin();
  }

  Widget _buildMine() {
      return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return _buildHeader(context,innerBoxIsScrolled);
          },
          body: _buildContent(),
      );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    return [
      SliverAppBar(
        expandedHeight: duSetHeight(160),
        elevation: 0,
        ///是否随着滑动隐藏标题
        floating: true,
        ///是否固定到顶部
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          collapseMode: CollapseMode.pin,
          title: Text(_user.value.userName,style: TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontFamily: 'FZFWQingYinTiJWL',
          ),),

          background: Image.asset(AssetsProvider.imagePath('footer',type: 'jpeg')),
        ),
      ),
    ];
  }

  Widget _buildContent(){
    return Center(child: Text('text'));
  }
}


class MineController extends GetxController{

  User onGetUser(){
    return Global.dbUtil.getCurrentUser();
  }
}


