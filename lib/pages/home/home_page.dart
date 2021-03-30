import 'package:flutter/material.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/pages/home/nav/home.dart';
import 'package:flutter_ui/pages/home/nav/mine.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  List<Widget> _pageList = [
    PageHome(),
    PageMine()
  ];


  List<BottomNavigationBarItem> _barList = [
    BottomNavigationBarItem(
      icon: Icon(Iconfont.home),
      activeIcon: Icon(Iconfont.selHome),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.mine),
      activeIcon: Icon(Iconfont.selMine),
      label: '我的',
    )
  ];


  List<String> textList= [
    '首页',
    '推荐',
    '关注',
    '我的',
  ];

  List<String> defaultIcon =[
    ImageUtils.assetsPath('tab_icon_shouye_default'),
    ImageUtils.assetsPath('tab_icon_huati_default'),
    ImageUtils.assetsPath('tab_icon_tuijian_default'),
    ImageUtils.assetsPath('tab_icon_wode_default')
  ];

  List<String> selectedIcon =[
    ImageUtils.assetsPath('tab_icon_shouye_selected'),
    ImageUtils.assetsPath('tab_icon_huati_selected'),
    ImageUtils.assetsPath('tab_icon_tujian_selected'),
    ImageUtils.assetsPath('tab_icon_wode_selected')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      // bottomNavigationBar: _buildBottomNavigationBar(context),
      bottomNavigationBar: _buildBottomAppBar(context),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          mini: true,
          backgroundColor: Colors.redAccent[100],
          elevation: 0.0, // 去掉Z轴阴影
          child: Icon(Iconfont.floating,color: Colors.white,size: 20),
          onPressed: (){

          },
        ),
    );
  }





  BottomAppBar _buildBottomAppBar(BuildContext context) {
    // final itemWidth = CommonUtils.getWidth()/5;
    final double itemWidth = getWidth()/5;
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      child: Row(
        children: [
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(0)),
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(1)),
          SizedBox(height: 48, width: itemWidth, child: Container()),
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(2)),
          SizedBox(height: 48, width: itemWidth, child: _buildItemBar(3)),
        ],
      ),
    );
  }


  Widget _buildItemBar(int index){
    return Container(
      alignment: Alignment.center,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(selectedIcon[index],width: 18,height: 18,),
            Padding(padding: EdgeInsets.only(top: 2)),
            Text(textList[index],style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZDaLTJ',
                color: Colors.redAccent
            ))
          ],
        ),
        onTap: () {

        },
      ),
    );
  }






  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      elevation: 2.2,
      backgroundColor: Colors.white,
      currentIndex: _currentIndex,
      items: _barList,
      iconSize: 18,
      selectedIconTheme: const IconThemeData(
          size: 18,
          color: Colors.redAccent
      ),
      unselectedIconTheme: const IconThemeData(
          size: 18,
          color: Colors.grey
      ),
      selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          fontFamily: 'FZDaLTJ',
          color: Colors.redAccent
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        fontFamily: 'FZDaLTJ',
      ),
      type: BottomNavigationBarType.fixed,
      onTap: (int value){
        setState(() {
          _currentIndex = value;
        });
      },
    );
  }
}
