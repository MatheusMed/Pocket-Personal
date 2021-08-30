import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';

class ExercicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.primary,
        elevation: 0,
        brightness: Brightness.dark,
      ),
      body: SizedBox(
        height: Get.height * 1,
        width: Get.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarCustom(
                titulo: '${data[0]}',
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.branco,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.1 - 60),
              Text('Descrição', style: TextStyleCustom.minimoTitle),
              SizedBox(height: Get.height * 0.1 - 70),
              Text(
                '${data[1]}',
                style: TextStyleCustom.padraoText,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.1 - 60),
              Divider(
                thickness: 1,
                height: 1,
                color: AppColors.primaryBase,
              ),
              SizedBox(height: Get.height * 0.1 - 60),
              Text('Execusão', style: TextStyleCustom.minimoTitle),
              SizedBox(height: Get.height * 0.1 - 70),
              Text(
                '${data[2]}',
                style: TextStyleCustom.padraoText,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.1 - 70),
              data[3] != null
                  ? Lottie.asset(
                      '${data[3]}',
                      fit: BoxFit.cover,
                      animate: true,
                      height: 200,
                    )
                  : Lottie.asset(
                      'assets/animation/padrao.json',
                      fit: BoxFit.cover,
                      animate: true,
                      height: 200,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
