import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/adicionarExercicio/adicionar_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:treinar_app/app/shared/widgets/textFormWidget/text_form_widget.dart';
import 'package:validatorless/validatorless.dart';

class AdicionarExercicio extends GetView<AdcionarExerController> {
  const AdicionarExercicio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 0,
        brightness: Brightness.dark,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarCustom(
              titulo: 'Cadastrar Exericio',
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  CommunityMaterialIcons.close_circle_outline,
                  size: 25,
                  color: AppColors.branco,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * .1 - 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Faça a criação de seus proprios exercicios',
                style: TextStyleCustom.titleMin,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Get.height * .1 - 50,
            ),
            Form(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    TextFormWidget(
                      titulo: 'Digite o titulo do exercicio',
                      controlador: controller.tituloC,
                      validator: Validatorless.required('Titulo Obrigatorio'),
                    ),
                    SizedBox(height: Get.height * 0.1 - 50),
                    TextFormWidget(
                      titulo: 'Digite uma breve descrição do exercicio',
                      controlador: controller.prevDescC,
                    ),
                    SizedBox(height: Get.height * 0.1 - 50),
                    TextFormWidget(
                      titulo: 'Digite a execusao do exercicio',
                      controlador: controller.execusaoC,
                      validator:
                          Validatorless.required('Exercusao Obrigatorio'),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: Get.height * .1 - 50),
            SizedBox(
              height: Get.height * .1 - 30,
              width: Get.width * .95,
              child: OutlinedButton(
                child:
                    Text('Cadastrar Exercicio', style: TextStyleCustom.textBtn),
                style: OutlinedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                ),
                onPressed: () => controller.validacaoExercicicioCustom(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
