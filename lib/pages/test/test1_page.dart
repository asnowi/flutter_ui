import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/utils/index.dart';

import 'package:flutter_ui/common/widget/tab/custom_tabs.dart' as CustomTabBar;
import 'package:flutter_ui/common/widget/tab/custom_indicator.dart' as CustomIndicator;
class Test1Page extends StatefulWidget {
  @override
  _Test1PageState createState() => _Test1PageState();
}


class _Test1PageState extends State<Test1Page> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  final List<CustomTabBar.Tab> _tabs = [
    CustomTabBar.Tab(
      text: '推荐',
    ),
    CustomTabBar.Tab(
      text: '关注',
    ),
  ];

  final List<Widget> _views =[
    Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey,
      alignment: Alignment.center,
      child: Text('推荐'),
    ),
  Container(
    alignment: Alignment.center,
    color: Colors.grey,
    child: Text('关注'),
    ),
  ];

  ScrollController _scrollController;
  // RefreshController _refreshController;

  @override
  void initState() {
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 1,
      child: Builder(
        builder: (BuildContext context) {
          final TabController tabController =
          DefaultTabController.of(context);
          tabController.addListener(() {
            if (!tabController.indexIsChanging) {

              LogUtils.GGQ("tab->${tabController.index}");
          }
          });
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(4, ScreenUtil().statusBarHeight, 4, 18),
              child: Column(
                children: [
                  Container(
                    height: 46,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(23),
                        bottomLeft: Radius.circular(23),
                      ),
                    ),
                    child: _tabs.isNotEmpty
                        ? _buildTabBar(context)
                        : Container(),
                  ),
                  Expanded(
                    child: _tabs.isNotEmpty
                        ? _buildTabBarView(context)
                        : Container(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  Widget _buildTabBar(BuildContext context) {
    return CustomTabBar.TabBar(
      onTap: (index) {},
      labelPadding: EdgeInsets.fromLTRB(12, 0, 12, 0),
      labelStyle: TextStyle(
        color: Colors.black54.withOpacity(0.6),
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: 'FZDaLTJ',
      ),
      labelColor: Colors.black,
      unselectedLabelColor: Colors.grey.shade400,
      unselectedLabelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        fontFamily: 'FZDaLTJ',
      ),
      indicatorSize: CustomTabBar.TabBarIndicatorSize.label,
      indicatorPadding: EdgeInsets.fromLTRB(8, 6, 8, 0),
      indicatorWeight: 2.2,
      indicator: CustomIndicator.UnderlineTabIndicator(
          hPadding: 15,
          borderSide: BorderSide(
            width: 3,
            color: Theme.of(context).accentColor.withOpacity(0.8),
          ),
          insets: EdgeInsets.zero),
      isScrollable: true,
      tabs: _tabs ?? [],
    );
  }


  Widget _buildTabBarView(BuildContext context){
    return CustomTabBar.TabBarView(
      children: _views,
    );
  }




  @override
  bool get wantKeepAlive => true;
}
