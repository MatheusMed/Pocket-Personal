import 'package:get/get.dart';
import 'package:treinar_app/app/modules/adicionarExercicio/adicionar_controller.dart';
import 'package:treinar_app/app/modules/pageView/page_view_controller.dart';

import 'package:treinar_app/app/modules/splash/splash_controller.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';

class BindConfigBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PageViewController>(() => PageViewController());
    Get.lazyPut<SplashController>(() => SplashController());
    Get.lazyPut<WelcomeController>(() => WelcomeController());
    Get.lazyPut<AdcionarExerController>(() => AdcionarExerController(),
        fenix: true);
  }
}
