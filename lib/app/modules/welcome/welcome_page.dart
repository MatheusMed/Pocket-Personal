import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/textFormWidget/text_form_widget.dart';
import 'package:validatorless/validatorless.dart';

class WelcomePage extends GetResponsiveView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height * .1 - 50,
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
                        tipoDeTeclado:
                            TextInputType.numberWithOptions(decimal: true),
                        validator: Validatorless.required('Altura Obrigatorio'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputMask(mask: '9.99', maxLength: 4)
                        ],
                      ),
                      SizedBox(height: Get.height * 0.1 - 50),
                      TextFormWidget(
                        titulo: 'Digite seu peso',
                        controlador: controller.pesoC,
                        tipoDeTeclado: TextInputType.number,
                        validator: Validatorless.required('Peso Obrigatorio'),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TextInputMask(mask: '999', maxLength: 3)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Get.height * .1 - 60),
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
      ),
    );
  }
}
