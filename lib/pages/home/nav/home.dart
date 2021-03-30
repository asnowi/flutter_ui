import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/widget/tab/custom_tabs.dart' as CustomTabBar;
import 'package:flutter_ui/common/widget/tab/custom_indicator.dart' as CustomIndicator;
class PageHome extends StatefulWidget {
  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> with SingleTickerProviderStateMixin {
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
      alignment: Alignment.center,
      child: Text('推荐'),
    ),
    Container(
      width: double.infinity,
      height: double.infinity,
      alignment: Alignment.center,
      child: Text('关注'),
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      initialIndex: 0,
      child: Builder(
        builder: (BuildContext context) {
          final TabController _tabController =
          DefaultTabController.of(context);
          _tabController.addListener(() {
            if (!_tabController.indexIsChanging) {
              LogUtils.GGQ("tab->${_tabController.index}");
            }
          });
          return Scaffold(
            body: Container(
              color: Colors.white,
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(0, ScreenUtil().statusBarHeight, 0, 0),
              child: Column(
                children: [
                  Container(
                    height: duSetHeight(48),
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
                        ? _buildTabBarView(context,_tabController)
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


  Widget _buildTabBarView(BuildContext context,TabController controller){
    return CustomTabBar.TabBarView(
      children: _views,
      controller: controller,
    );
  }
}
