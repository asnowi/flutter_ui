import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var top = 0.0;

    return [
      // SliverAppBar(
      //   expandedHeight: duSetHeight(272),
      //   elevation: .8,
      //   ///是否随着滑动隐藏标题
      //   floating: false,
      //   ///是否固定到顶部
      //   pinned: true,
      //   flexibleSpace: FlexibleSpaceBar(
      //     centerTitle: true,
      //     collapseMode: CollapseMode.pin,
      //     title: Text(_user.value.userName,style: TextStyle(
      //       fontSize: 12,
      //       color: Colors.black87,
      //       fontWeight: FontWeight.bold,
      //       fontFamily: 'FZFWQingYinTiJWL',
      //     ),),
      //     background: Image.asset(AssetsProvider.imagePath('personal_top_bg_big'),fit: BoxFit.fill,),
      //   ),
      // ),

      SliverAppBar(
          expandedHeight: duSetHeight(123),
          elevation: .8,
          floating: true,
          pinned: true,
          flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    centerTitle: true,
                    // title: AnimatedOpacity(
                    //     duration: Duration(milliseconds: 300),
                    //     opacity: top == 80.0 ? 1.0 : 0.0,
                    //     // opacity: 1.0,
                    //     child: Row(
                    //       children: [
                    //         CircleAvatar(
                    //           radius: 30,
                    //           backgroundImage: NetworkImage('https://p3.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg'),
                    //         ),
                    //         Text(
                    //           _user.value.userName,
                    //           style: TextStyle(
                    //             fontSize: 12,
                    //             color: Colors.black87,
                    //             fontWeight: FontWeight.bold,
                    //             fontFamily: 'FZFWQingYinTiJWL',
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    // ),
                    title: Container(
                      padding: EdgeInsets.fromLTRB(10, 36, 10, 0),
                      // margin: EdgeInsets.fromLTRB(10, 36, 10, 2),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top == 80.0 ? 1.0 : 1.0,
                            child: CircleAvatar(
                              radius: 22,
                              backgroundImage: NetworkImage('https://p3.music.126.net/GE2kVDwdVQyoNJC8k31mEA==/18979769718754963.jpg'),
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(right: 6)),
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top == 80.0 ? 1.0 : 1.0,
                            child: Text(_user.value.userName,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'FZFWQingYinTiJWL',
                              )
                            ),
                          )
                        ],
                      ),
                    ),
                    background: Image.asset(AssetsProvider.imagePath('personal_top_bg_big'),fit: BoxFit.fill));
              })),
    ];
  }

  Widget _buildContent(){
    return Center(
        child: Container(
          child: Column(
            children: [
              Text('sssss'),
            ],
          ),
        ),
    );
  }
}


class MineController extends GetxController{

  User onGetUser(){
    return Global.dbUtil.getCurrentUser();
  }
}


