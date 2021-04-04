import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageFly extends StatelessWidget {

  //每页显示数量
  static const int PAGE_SIZE = 10;
  //当前为第几页
  int page = 1;
  //是否加载过数据
  bool loaded;
  //是否允许上拉
  bool _enablePullUp = true;
  //listview数据源
  List<String> _list = [
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
    '1',
  ];
  //刷新加载控制器
  RefreshController _refreshController = RefreshController(initialRefresh: false);



  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      ///可在此通过header:和footer:指定个性效果
      //允许下拉
      enablePullDown: true,
      //允许上拉加载
      enablePullUp: _enablePullUp,
      //控制器
      controller: _refreshController,
      //刷新回调方法
      onRefresh: _onRefresh,
      //加载下一页回调
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: (c, i) => Text('ssss'),
        itemCount: _list.length,
      ),
    );
  }

  void _onRefresh() async {
    _loadData(true);
  }

  void _onLoading() async {
    _loadData(false);
  }

  void _initData() async {
    _loadData(true);
  }

  _loadData(final bool onRefresh) async {

    await _list.add('value');
  }

}
