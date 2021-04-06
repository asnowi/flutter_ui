import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/config/index.dart';
import 'package:flutter_ui/common/db/index.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/widget/text/icon_text.dart';
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
          body: _buildContent(context),
      );
  }

  List<Widget> _buildHeader(BuildContext context, bool innerBoxIsScrolled) {
    var top = 0.0;
    return [
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
                    title: Container(
                      padding: EdgeInsets.fromLTRB(10, 36, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
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
                            child: Container(
                              height: duSetHeight(28),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(_user.value.userName,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black87,
                                        // fontWeight: FontWeight.bold,
                                        // fontFamily: 'FZFWQingYinTiJWL',
                                      )
                                  ),
                                ],
                              ),
                            )
                          ),
                        ],
                      ),
                    ),
                    background: Image.asset(AssetsProvider.imagePath('personal_top_bg_big'),fit: BoxFit.fill));
              })),
    ];
  }

  Widget _buildContent(BuildContext context){
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(10, 4, 10,8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Column(
                      children: [
                        Text('0',style: TextStyle(fontSize: 12),),
                        Text('动态',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text('0'),
                        Text('关注',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                      ],
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text('0'),
                        Text('粉丝',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(height: 200,color: Colors.grey[50],),
            Container(
              padding: EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  IconText(txt: '我的位置',icon: Icon(Iconfont.location,size: 14,color: Colors.black54),onClick: (){
                      Get.toNamed(Routes.baiduMap);
                  },),
                  Divider(height: 1,color: Colors.grey[50],thickness: 1,indent: 30,),
                  IconText(txt: '我的收藏',icon: Icon(Iconfont.about,size: 14,color: Colors.black54),onClick: (){},),
                  Divider(height: 1,color: Colors.grey[50],thickness: 1,indent: 30,),
                  IconText(txt: '版本',icon: Icon(Iconfont.about,size: 14,color: Colors.black54),onClick: (){},),
                  Padding(padding: EdgeInsets.only(top: 50)),
                  FractionallySizedBox(
                    widthFactor: 0.9,
                    child: ElevatedButton(onPressed: (){
                     //  退出登录
                     _showLogout(context);
                    }, child: Text('退出登录',style: TextStyle(color: Colors.white,fontSize: 14),),style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                    ),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showLogout(BuildContext context) {
  showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text('温馨提示',style: TextStyle(fontSize: 14),),
          content: Text('您确定要退出账号？',style: TextStyle(fontSize: 14)),
          actions: [
            CupertinoDialogAction(child: Text('确定',style: TextStyle(fontSize: 12,color: Colors.blue)),onPressed: ()async{
              int value = await Global.dbUtil.userBox.clear();
              LogUtils.GGQ('删除用户：${value}');
              Navigator.of(context).pop();
              //发送事件
              final event = CommonEvent(EventCode.EVENT_LOGIN,message: value.toString());
              EventBusUtils.send(event);
            },),
            CupertinoDialogAction(child: Text('取消',style: TextStyle(fontSize: 12,color: Colors.blue)),onPressed: (){
              Navigator.of(context).pop();
            },),
          ],
        );
      }
  );

}


class MineController extends GetxController{
  User onGetUser(){
    return Global.dbUtil.getCurrentUser();
  }
}


