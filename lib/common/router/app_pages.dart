import 'package:flutter/cupertino.dart';
import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/pages/agreement/agreement_page.dart';
import 'package:flutter_ui/pages/home/home_page.dart';
import 'package:flutter_ui/pages/login/login_page.dart';
import 'package:flutter_ui/pages/splash/splash_page.dart';
import 'package:flutter_ui/pages/welcome/welcome_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.index,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.welcome,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.home,
      page: () => HomePage(),
    ),
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
    ),
    GetPage(
        name: Routes.agreement,
        page: () => AgreementPage(),
        transition: Transition.rightToLeftWithFade
    ),
  ];
}