import 'package:flutter_ui/common/router/index.dart';
import 'package:flutter_ui/pages/home/home_page.dart';
import 'package:flutter_ui/pages/splash/splash_page.dart';
import 'package:flutter_ui/pages/welcome/welcome_page.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.Initial,
      page: () => SplashPage(),
    ),
    GetPage(
      name: Routes.Welcome,
      page: () => WelcomePage(),
    ),
    GetPage(
      name: Routes.Home,
      page: () => HomePage(),
    ),
  ];
}