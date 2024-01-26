import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/adicionarExercicio/adicionar_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class ExerciciosCustomPage extends GetView<AdcionarExerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: SizedBox(
        height: Get.height * 1,
        width: Get.width * 1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBarCustom(
                titulo: 'Exercicios Customizados',
                trailing: Icon(
                  CommunityMaterialIcons.puzzle_outline,
                  size: 32,
                  color: AppColors.branco,
                ),
              ),
              Obx(() {
                return SizedBox(
                  height: Get.height * .5,
                  width: Get.width * 1,
                  child: ListView.builder(
                    itemCount: controller.listExercicios.length,
                    itemBuilder: (context, i) {
                      final item = controller.listExercicios[i];
                      return ListtileCustom(
                        titulo: Text(
                          item.titulo!,
                          style: TextStyleCustom.padraoBranco,
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.branco,
                        ),
                        onLongPress: () {
                          controller.showModalDelete(item.id!);
                        },
                        onCLik: () => Get.toNamed(
                          '/exerc',
                          preventDuplicates: true,
                          arguments: [
                            item.titulo,
                            item.prevDescricao,
                            item.execusao,
                            'assets/animation/padrao.json',
                          ],
                        ),
                      );
                    },
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
