import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';

import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';

import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class TypeExercicio extends GetResponsiveView<WelcomeController> {
  final args = Get.arguments;
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
        child: SizedBox(
          width: Get.width,
          child: Column(
            children: [
              AppBarCustom(
                titulo: 'Lista de treino',
                leading: IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: AppColors.branco,
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.1 - 70),
              SizedBox(
                height: Get.height * .8,
                width: Get.width * .96,
                child: ListView.separated(
                  itemCount: args.length,
                  separatorBuilder: (_, __) => Divider(
                    thickness: 2,
                    height: 10,
                    endIndent: 10,
                    indent: 10,
                    color: AppColors.primaryBase,
                  ),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return ListtileCustom(
                      titulo: Text(
                        '${args[i].titulo}',
                        style: TextStyleCustom.padraoBranco,
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.branco,
                      ),
                      onCLik: () => Get.toNamed(
                        '/exerc',
                        preventDuplicates: true,
                        arguments: [
                          args[i].titulo,
                          args[i].prevDescricao,
                          args[i].execusao,
                          args[i].imagem
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
