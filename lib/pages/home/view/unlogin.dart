import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class UnLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset(AssetsProvider.lottiePath('5431-general-congrats')),
            Container(
              width: ScreenUtil().screenWidth * 0.4,
              child: ElevatedButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 12)),
                    shape: MaterialStateProperty.all(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.all(Colors.redAccent)
                ),
                onPressed: (){
                  Get.toNamed(Routes.login);
                },
                child: Text('请先登录',style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'FZFWQingYinTiJWL',
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
