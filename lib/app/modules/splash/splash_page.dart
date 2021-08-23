import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/splash/splash_controller.dart';

import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class SplashPage extends GetView<SplashController> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/loading.png',
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: Get.width * 0.1,
                right: Get.width * 0.1,
                bottom: Get.height * 0.3,
                child: Text(
                  'Faça sua rotina no Poket Personal',
                  textAlign: TextAlign.center,
                  style: TextStyleCustom.title,
                ),
              ),
              Positioned(
                bottom: 60,
                height: 55,
                left: Get.width * 0.1,
                right: Get.width * 0.1,
                child: OutlinedButton(
                  child: Text('Proximo', style: TextStyleCustom.textBtn),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                  ),
                  onPressed: () => controller.proxima(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
