import 'package:get/get.dart';
import 'package:treinar_app/app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController(), permanent: false);
  }
}
