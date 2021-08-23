import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/textFormWidget/text_form_widget.dart';

class WelcomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Get.height * .1 - 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Digite algumas de suas informaçoẽs para que possamos avaliar e assim passar a sua rotina',
                style: TextStyleCustom.titleMin,
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: Get.height * .1,
            ),
            Form(
              key: controller.formkey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormWidget(
                      titulo: 'Digite seu nome',
                      controlador: controller.nomeC,
                    ),
                    SizedBox(height: Get.height * 0.1 - 50),
                    TextFormWidget(
                      titulo: 'Digite sua altura',
                      controlador: controller.alturaC,
                    ),
                    SizedBox(height: Get.height * 0.1 - 50),
                    TextFormWidget(
                      titulo: 'Digite seu peso',
                      controlador: controller.pesoC,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              'Selecione seu sexo',
              style: TextStyleCustom.titleRadio,
            ),
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    activeColor: AppColors.primary,
                    value: controller.numberValue0.value,
                    groupValue: controller.selectedValue.value,
                    onChanged: (value) => controller.pressRadioButon(value),
                  ),
                  Text('Masculino'),
                  Radio(
                    value: controller.numberValue1.value,
                    activeColor: AppColors.primary,
                    groupValue: controller.selectedValue.value,
                    onChanged: (value) => controller.pressRadioButon(value),
                  ),
                  Text('Feminino'),
                  Radio(
                    activeColor: AppColors.primary,
                    value: controller.numberValue2.value,
                    groupValue: controller.selectedValue.value,
                    onChanged: (value) => controller.pressRadioButon(value),
                  ),
                  Text('Prefiro nao dizer')
                ],
              );
            }),
            SizedBox(height: Get.height * .1),
            SizedBox(
              height: Get.height * .1 - 30,
              width: Get.width * .95,
              child: OutlinedButton(
                child: Text('Cadastrar', style: TextStyleCustom.textBtn),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () {
                  Get.toNamed('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
