import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:treinar_app/app/bindings/bindins_config.dart';

import 'package:treinar_app/app/modules/adicionarExercicio/adicionar_exercicio.dart';
import 'package:treinar_app/app/modules/exercicio/exercicio_page.dart';
import 'package:treinar_app/app/modules/exerciciosCustoms/exercicios_custom_page.dart';
import 'package:treinar_app/app/modules/home/home_page.dart';
import 'package:treinar_app/app/modules/pageView/page_view_home.dart';

import 'package:treinar_app/app/modules/splash/splash_page.dart';
import 'package:treinar_app/app/modules/welcome/welcome_page.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => SplashPage(),
      binding: BindConfigBinding(),
    ),
    GetPage(
      name: Routes.PAGEVIEW,
      page: () => PageViewHome(),
      binding: BindConfigBinding(),
    ),
    GetPage(
      name: Routes.WELCOME,
      page: () => WelcomePage(),
      binding: BindConfigBinding(),
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: BindConfigBinding(),
    ),
    GetPage(
      name: Routes.EXERCICIOS,
      page: () => ExercicioPage(),
    ),
    GetPage(
      name: Routes.ADDEXERCICIOS,
      page: () => AdicionarExercicio(),
      binding: BindConfigBinding(),
    ),
    GetPage(
      name: Routes.CUSTOMEXERCICIOS,
      page: () => ExerciciosCustomPage(),
      binding: BindConfigBinding(),
    ),
  ];
}
