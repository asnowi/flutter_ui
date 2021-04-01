import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/global.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if(_timer.tick >= 1){
        _timer.cancel();
        if(Global.hasHome){
          Get.offNamed(Routes.home);
        }else{
          Get.offNamed(Routes.welcome);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.redAccent,
      ),
    );
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

