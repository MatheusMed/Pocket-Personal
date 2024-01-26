import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/splash/splash_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class SplashPage extends GetResponsiveView<SplashController> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: SizedBox(
        width: Get.width,
        height: Get.height * 0.88,
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
                'Bem vindo faça sua rotina no Pocket Personal',
                textAlign: TextAlign.center,
                style: TextStyleCustom.title,
              ),
            ),
            Positioned(
              bottom: 60,
              height: 55,
              left: Get.width * 0.1 - 20,
              right: Get.width * 0.1 - 20,
              child: OutlinedButton(
                child: Text('Proximo', style: TextStyleCustom.textBtn),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () => controller.dadosPessoas(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
