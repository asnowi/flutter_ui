//全局配置
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_ui/common/config/index.dart';
import 'package:flutter_ui/common/utils/index.dart';
import 'package:lottie/lottie.dart';
import 'package:package_info/package_info.dart';

import 'common/db/index.dart';

class Global {
  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  static bool hasHome = false;

  /// 是否 ios
  static bool isIOS = Platform.isIOS;
  /// 是否 android
  static bool isAndroid = Platform.isAndroid;

  /// android 设备信息
  static AndroidDeviceInfo androidDeviceInfo;

  /// ios 设备信息
  static IosDeviceInfo iosDeviceInfo;

  /// 包信息
  static PackageInfo packageInfo;

  static DBUtil dbUtil;

  static User userInfo;
  /// init
  static Future init() async {
  // 运行初始
    WidgetsFlutterBinding.ensureInitialized();

    // 工具初始
    await StorageUtil.init();
    // hive
    await DBUtil.install();
    dbUtil = await DBUtil.getInstance();

    // 第一次打开应用
    hasHome = StorageUtil().getBool(SaveInfoKey.HAS_HOME);

    userInfo = dbUtil.getCurrentUser();

    EasyLoading.instance
      ..loadingStyle = EasyLoadingStyle.custom
      ..maskColor = Colors.black
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white
      ..animationStyle = EasyLoadingAnimationStyle.opacity
      ..textColor = Colors.white
      ..indicatorType = EasyLoadingIndicatorType.circle
      ..indicatorSize = 32
      ..radius = 8
      ..fontSize = 12
      ..contentPadding = const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      )
      ..indicatorWidget = Container(
        color: Colors.black,
        width: 42,
        height: 42,
        child: Lottie.asset(AssetsProvider.lottiePath('loadingYellow')),
      )
      ..dismissOnTap = true;


    //  android 状态栏为透明的沉浸
    if (isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarDividerColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark
      );
      LogUtils.GGQ('SystemUiOverlayStyle');
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    // 强制竖屏
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ]);

    // 读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIOS) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }

    // 包信息
    Global.packageInfo = await PackageInfo.fromPlatform();
  }
}