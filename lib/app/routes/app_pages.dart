import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:treinar_app/app/bindings/splash_binding.dart';
import 'package:treinar_app/app/bindings/welcome_binding.dart';
import 'package:treinar_app/app/modules/home/home_page.dart';
import 'package:treinar_app/app/modules/splash/splash_page.dart';
import 'package:treinar_app/app/modules/welcome/welcome_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: WelcomeBinding(),
    ),
  ];
}
