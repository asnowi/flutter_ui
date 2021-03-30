import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/theme/app_theme.dart';
import 'package:flutter_ui/common/utils/screen.dart';
import 'package:flutter_ui/global.dart';
import 'package:flutter_ui/pages/home/home_page.dart';
import 'package:flutter_ui/pages/welcome/welcome_page.dart';
import 'package:get/get.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: designSize(),
        allowFontScaling: false,
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter UI',
              theme: appThemeData,
              initialRoute: '/',
              getPages: AppPages.pages,
             // home: SplashPage(),
              home: Global.hasHome? HomePage(): WelcomePage(),
              // home: Test1Page(),
            ));
  }
}
