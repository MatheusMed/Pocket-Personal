import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<WelcomeController>(WelcomeController(), permanent: true);
  }
}
