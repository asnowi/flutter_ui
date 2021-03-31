import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/utils/assets.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {},
              child: Text('帮助',
                  style: TextStyle(color: Colors.black, fontSize: 14.0)))
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: ScreenUtil().screenWidth * 0.8,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)
              ),
              onPressed: (){
              },
              child: Text('手机号登录',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZFWQingYinTiJWL',
              ),),
            ),
          ),
          Container(
            width: ScreenUtil().screenWidth * 0.8,
            child: ElevatedButton(
              style: ButtonStyle(
                  padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                  backgroundColor: MaterialStateProperty.all(Colors.redAccent)
              ),
              onPressed: (){
              },
              child: Text('立即体验',style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: 'FZFWQingYinTiJWL',
              ),),
            ),
          ),
        ],
      ),
    );
  }
}

