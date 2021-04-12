import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ui/common/config/index.dart';
import 'package:flutter_ui/common/db/index.dart';
import 'package:flutter_ui/common/entity/account_profile_entity.dart';
import 'package:flutter_ui/common/http/index.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/widget/refresh/refresh.dart';
import 'package:flutter_ui/common/widget/text/icon_text.dart';
import 'package:flutter_ui/global.dart';
import 'package:flutter_ui/pages/home/view/unlogin.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:flutter_ui/common/entity/account_entity.dart';

class PageMine extends StatefulWidget {
  @override
  _PageMineState createState() => _PageMineState();
}

class _PageMineState extends State<PageMine> {

  final MineController mineController = Get.put(MineController());

  StreamSubscription<CommonEvent> _subscription;
  final _user = User().obs;


  //刷新加载控制器
  final RefreshController _refreshController = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _user.value = Global.userInfo;
    if(_user.value != null){
      LogUtils.GGQ('user-phone>${_user.value.phone}');
      LogUtils.GGQ('user-name>${_user.value.userName}');
      LogUtils.GGQ('user-avatarImg>${_user.value.avatarImg}');
      LogUtils.GGQ('user-id>${_user.value.userId}');
    }

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
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top == 80.0 ? 1.0 : 1.0,
                            // child: CircleAvatar(
                            //   radius: 22,
                            //   backgroundImage: (_user.value != null && _user.value.avatarImg != null)? NetworkImage(_user.value.avatarImg) : null,
                            // ),
                            child: ClipOval(
                              child: Obx(() => ConstrainedBox(
                                  constraints: BoxConstraints.loose(Size(44,44)),
                                  child: (_user.value != null && _user.value.avatarImg != null) ? Image.network(_user.value.avatarImg,fit: BoxFit.fill,): Image.asset(AssetsProvider.imagePath('img_avatar_default')))
                              ),
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

    _onRefresh();

    return Refresh(
      // ///可在此通过header:和footer:指定个性效果
      // //允许下拉
      enablePullDown: true,
      //允许上拉加载
      enablePullUp: false,
      //控制器
      controller: _refreshController,
      //刷新回调方法
      onRefresh: _onRefresh,
      onLoading: _onLoading,
      content: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10, 12, 10,8),
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
                          Text((mineController.profile.value.eventCount == null)? '0' : '${mineController.profile.value.eventCount}',style: TextStyle(fontSize: 12),),
                          Text('动态',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text((mineController.profile.value.follows == null)? '0' : '${mineController.profile.value.follows}',style: TextStyle(fontSize: 12),),
                          Text('关注',style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold,fontFamily: 'FZFWQingYinTiJWL'),),
                        ],
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text((mineController.profile.value.cCount == null)? '0' : '${mineController.profile.value.cCount}',style: TextStyle(fontSize: 12),),
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
      ),
    );
  }

  void _onRefresh() async {

    HttpUtils.get(Apis.test,params: {'uid': Global.userInfo.userId},success: (data) {
      LogUtils.GGQ(data);
      AccountEntity accountEntity = AccountEntity.fromMap(data);
      if(accountEntity != null){
        AccountProfileEntity profileEntity = accountEntity.profile;
        if(profileEntity != null){
          mineController.onChangeProfile(profileEntity);
          LogUtils.GGQ('动态-->>>>>${profileEntity.eventCount}');
          LogUtils.GGQ('关注-->>>>>${profileEntity.follows}');
          LogUtils.GGQ('粉丝-->>>>>${profileEntity.followMe}');
        }
      }
    },fail: (e){
      LogUtils.GGQ(e);
    },always: (){
      if( _refreshController.isRefresh){
        _refreshController.refreshToIdle();
      }

    },hasLoading: false);
  }

  void _onLoading() async {}

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
                Global.userInfo = null;

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

}



class MineController extends GetxController{
  User onGetUser(){
    return Global.userInfo;
  }


  final profile = AccountProfileEntity().obs;
  void onChangeProfile(AccountProfileEntity profile){
    this.profile.value = profile;
  }
}


