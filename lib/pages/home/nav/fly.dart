import 'package:flutter/material.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/widget/refresh/refresh.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageFly extends StatelessWidget {

  final FlyController flyController = FlyController();

  //每页显示数量
  static const int PAGE_SIZE = 10;
  //当前为第几页
  int page = 1;
  //是否加载过数据
  bool loaded;
  //是否允许下拉
  bool _enablePullDown = true;
  //是否允许上拉
  bool _enablePullUp = true;

  //刷新加载控制器
  RefreshController _refreshController = RefreshController(initialRefresh: false);


  @override
  Widget build(BuildContext context) {
    _initData();

    return Refresh(
      ///可在此通过header:和footer:指定个性效果
      //允许下拉
      enablePullDown: _enablePullDown,
      //允许上拉加载
      enablePullUp: _enablePullUp,
      //控制器
      controller: _refreshController,
      //刷新回调方法
      onRefresh: _onRefresh,
      //加载下一页回调
      onLoading: _onLoading,
      content: Obx(() => ListView.builder(
        itemBuilder: (c, i) => _buildItem(c,i),
        itemCount: flyController.list.value.length,
      )),
    );
  }

  void _onRefresh() async {
    flyController.list.value.clear();
    for(var i = 0; i >= 10; i++){
      flyController.list.value.add(i.toString());
    }
  }

  void _onLoading() async {
    for(var i = flyController.list.value.length; i >= flyController.list.value.length +10; i++){
      flyController.list.value.add(i.toString());
    }
  }

  void _initData() async {
    // for(var i = 0; i >= 10; i++){
    //   flyController.list.value.add(i.toString());
    // }

    await flyController.onListUpdate([1,2,3]);
  }
}

Widget _buildItem(BuildContext c, int i) {
  return Text(i.toString());
}


class FlyController extends GetxController{

  final list = [].obs;



  void onListUpdate(List l) {
    this.list.value.addAll(l);
  }
}

