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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
