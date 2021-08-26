import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class ExercicioPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        brightness: Brightness.dark,
        title: Text(
          "${data[0]}",
          style: TextStyleCustom.padraoBranco,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: Get.height * 0.1 - 60),
              Text(
                '${data[0]}',
                style: TextStyleCustom.title,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: Get.height * 0.1 - 60),
              Divider(
                thickness: 1,
                height: 1,
                color: AppColors.primaryBase,
              ),
              SizedBox(height: Get.height * 0.1 - 60),
              Text('Descricão', style: TextStyleCustom.minimoTitle),
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
            ],
          ),
        ),
      ),
    );
  }
}
