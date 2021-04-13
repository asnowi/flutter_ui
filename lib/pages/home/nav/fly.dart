import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/widget/refresh/refresh.dart';
import 'package:flutter_ui/common/widget/title/title_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PageFly extends StatefulWidget {
  @override
  _PageFlyState createState() => _PageFlyState();
}

class _PageFlyState extends State<PageFly> {

  RefreshController _refreshController = RefreshController(initialRefresh: false);

    //是否允许下拉
  bool _enablePullDown = true;
  //是否允许上拉
  bool _enablePullUp = true;

  int listSize = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TitleBar(title: 'fly'),
      body: GetBuilder<FlyController>(
          init: FlyController(),
          builder: (controller) => Refresh(
            ///可在此通过header:和footer:指定个性效果
            //允许下拉
              enablePullDown: _enablePullDown,
              //允许上拉加载
              enablePullUp: _enablePullUp,
              //控制器
              controller: _refreshController,
              //刷新回调方法
              onRefresh: ()=>_onRefresh(controller),
              //加载下一页回调
              onLoading: ()=>_onLoading(controller),

              content: ListView.builder(
                itemBuilder: (BuildContext context, int index) => _buildItem(context,index),
                itemCount: listSize,
              )
          ))
    );
  }

  void _onRefresh(FlyController controller) {
     DelayedUtil.delayed(2000, () {
      controller.dataList.clear();
      final list = [1,2,3,4];
      controller.onUpdateList(list);
      setState(() {
        listSize = controller.dataList.length;
        _refreshController.refreshToIdle();
      });
      LogUtils.GGQ('size:${controller.dataList.length}');
    });
  }

  void _onLoading(FlyController controller) {
    DelayedUtil.delayed(2000, () {
      final list = [10,20,20,30,40,20,30,40,20,30,40,30,40,20,30,40,20,30,40,20,30,40];
      controller.onUpdateList(list);
      setState(() {
        listSize = controller.dataList.length;
        _refreshController.loadComplete();
      });
      LogUtils.GGQ('size:${controller.dataList.length}');
    });
  }

  Widget _buildItem(BuildContext context, int index) {
    if(index == 0){
      return _buildBanner();
    }
    return Text('sss',style: TextStyle(color: Colors.black87),);
  }

  Widget _buildBanner(){
    return Container(
      height: 200,
      child: Swiper(
        // 横向
        scrollDirection: Axis.horizontal,
        // 布局构建
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            'http://hbimg.b0.upaiyun.com/a3e592c653ea46adfe1809e35cd7bc58508a6cb94307-aaO54C_fw658',
            fit: BoxFit.fill,
          );
        },
        //条目个数
        itemCount: 6,
        // 自动翻页
        autoplay: true,
        // 分页指示
        pagination: SwiperPagination(
          builder: MyDotSwiperPaginationBuilder()
        ),
        //点击事件
        onTap: (index) {
          Toast.show('${index.toString()}');
        },
        // 相邻子条目视窗比例
        viewportFraction: 1,
        // 布局方式
        //layout: SwiperLayout.STACK,
        // 用户进行操作时停止自动翻页
        autoplayDisableOnInteraction: true,
        // 无线轮播
        loop: true,
        //当前条目的缩放比例
        scale: 1,
      ),
    );
  }
}

class FlyController extends GetxController{

  final dataList = [].obs;

  void onUpdateList(List l) {
    this.dataList.addAll(l);
  }

}

class MyDotSwiperPaginationBuilder extends DotSwiperPaginationBuilder{

  @override
  double get size => 6.0;

  @override
  double get activeSize => 6.0;

  @override
  Color get color => Colors.black12;

  @override
  Color get activeColor => Colors.redAccent;
}

