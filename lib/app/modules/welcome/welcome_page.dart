import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/textButtonWidget/radio_button_widget.dart';
import 'package:treinar_app/app/shared/widgets/textFormWidget/text_form_widget.dart';
import 'package:validatorless/validatorless.dart';

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
                      validator: Validatorless.required('Nome Obrigatorio'),
                    ),
                    SizedBox(height: Get.height * 0.1 - 50),
                    TextFormWidget(
                      titulo: 'Digite sua altura',
                      controlador: controller.alturaC,
                      validator: Validatorless.required('Altura Obrigatorio'),
                    ),
                    SizedBox(height: Get.height * 0.1 - 50),
                    TextFormWidget(
                      titulo: 'Digite seu peso',
                      controlador: controller.pesoC,
                      validator: Validatorless.required('Peso Obrigatorio'),
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
                  RadioButtonWidget(
                      valor: controller.numberValue0.value,
                      valorGrupo: controller.selectedValue.value,
                      funcao: (value) => controller.pressRadioButon(value)),
                  Text('Masculino', style: TextStyleCustom.padrao),
                  RadioButtonWidget(
                      valor: controller.numberValue1.value,
                      valorGrupo: controller.selectedValue.value,
                      funcao: (value) => controller.pressRadioButon(value)),
                  Text('Feminino', style: TextStyleCustom.padrao),
                  RadioButtonWidget(
                      valor: controller.numberValue2.value,
                      valorGrupo: controller.selectedValue.value,
                      funcao: (value) => controller.pressRadioButon(value)),
                  Text('Prefiro nao dizer', style: TextStyleCustom.padrao),
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
                onPressed: () => controller.validade(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
