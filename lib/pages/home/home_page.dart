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
      icon: Icon(Iconfont.home,size: 18),
      activeIcon: Icon(Iconfont.selHome,color: Colors.redAccent,size: 18),
      label: '首页',
    ),
    BottomNavigationBarItem(
      icon: Icon(Iconfont.mine,size: 18),
      activeIcon: Icon(Iconfont.selMine,color: Colors.redAccent,size: 18),
      label: '我的',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        items: _barList,
        iconSize: 18,
        selectedLabelStyle: TextStyle(color: Colors.redAccent,fontSize: 12),
        unselectedLabelStyle: TextStyle(color: Colors.grey,fontSize: 12),
        type: BottomNavigationBarType.fixed,
        onTap: (int value){
          setState(() {
            _currentIndex = value;
          });
        },
      ),
    );
  }
}
