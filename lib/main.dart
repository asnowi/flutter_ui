import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/common/theme/app_theme.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:flutter_ui/common/utils/screen.dart';
import 'package:flutter_ui/global.dart';
import 'package:flutter_ui/pages/splash/splash_page.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));

  // runZonedGuarded<Widget>((){
  //     ErrorWidget.builder = (FlutterErrorDetails details) {
  //       Zone.current.handleUncaughtError(details.exception, details.stack);
  //       return ErrorPage(
  //           details.exception.toString() + "\n " + details.stack.toString(), details);
  //     };
  //     Global.init().then((value) => runApp(MyApp()));
  //   }, (Object obj, StackTrace stack) {
  //     print(obj);
  //     print(stack);
  // });




  // runZonedGuarded<Widget>(
  //     app,
  //     error
  // );
}

Widget app() {
  return Container(
    child: Text('app'),
  );
}

error(Object error, StackTrace stack) {

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: designSize(),
        allowFontScaling: false,

        builder: () => RefreshConfiguration(
                  headerBuilder: () => MaterialClassicHeader(),
                  // 配置头部默认下拉刷新视图
                  footerBuilder: () => ClassicFooter(),
                  // 配置底部默认上拉加载视图
                  headerTriggerDistance: 80.0,
                  // 头部触发刷新的距离
                  springDescription:
                  SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
                  // 自定义弹回动画
                  maxOverScrollExtent: 100,
                  //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
                  maxUnderScrollExtent: 0,
                  // Maximum dragging range at the bottom
                  enableScrollWhenRefreshCompleted: true,
                  //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
                  enableLoadingWhenFailed: true,
                  //In the case of load failure, users can still trigger more loads by gesture pull-up.
                  hideFooterWhenNotFull: false,
                  // Disable pull-up to load more functionality when Viewport is less than one screen
                  enableBallisticLoad: true,
                  // child: Global.hasHome? HomePage(): WelcomePage(),
                  child: GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter UI',
                    theme: appThemeData,
                    initialRoute: '/',
                    getPages: AppPages.pages,
                    home: SplashPage(),
                    //  home: Global.hasHome? HomePage(): WelcomePage(),
                    // home: Test1Page(),
                    builder: EasyLoading.init(),
                  ),
        ),);


        // builder: () => GetMaterialApp(
        //       debugShowCheckedModeBanner: false,
        //       title: 'Flutter UI',
        //       theme: appThemeData,
        //       initialRoute: '/',
        //       getPages: AppPages.pages,
        //      // home: SplashPage(),
        //      //  home: Global.hasHome? HomePage(): WelcomePage(),
        //       // home: Test1Page(),
        //       home: RefreshConfiguration(
        //         headerBuilder: () => MaterialClassicHeader(),
        //         // 配置头部默认下拉刷新视图
        //         footerBuilder: () => ClassicFooter(),
        //         // 配置底部默认上拉加载视图
        //         headerTriggerDistance: 80.0,
        //         // 头部触发刷新的距离
        //         springDescription:
        //         SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        //         // 自定义弹回动画
        //         maxOverScrollExtent: 100,
        //         //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
        //         maxUnderScrollExtent: 0,
        //         // Maximum dragging range at the bottom
        //         enableScrollWhenRefreshCompleted: true,
        //         //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
        //         enableLoadingWhenFailed: true,
        //         //In the case of load failure, users can still trigger more loads by gesture pull-up.
        //         hideFooterWhenNotFull: false,
        //         // Disable pull-up to load more functionality when Viewport is less than one screen
        //         enableBallisticLoad: true,
        //         // child: Global.hasHome? HomePage(): WelcomePage(),
        //         child: SplashPage(),
        //       ),
        //       builder: EasyLoading.init(),
        //     ));
  }
}
