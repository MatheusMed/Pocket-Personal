import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/adicionarExercicio/adicionar_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class ExerciciosCustomPage extends GetView<AdcionarExerController> {
  @override
  Widget build(BuildContext context) {
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
              Container(
                height: Get.height * .12,
                padding: EdgeInsets.only(top: 20, left: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                  color: AppColors.primary,
                ),
                child: ListTile(
                  title: Text(
                    'Exercicios Customizados',
                    style: TextStyleCustom.textBtn,
                  ),
                  trailing: Icon(
                    CommunityMaterialIcons.puzzle_outline,
                    size: 32,
                    color: AppColors.branco,
                  ),
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
                          Get.defaultDialog(
                            title: 'Deletar nota',
                            titleStyle: TextStyleCustom.minimoTitle,
                            content: Container(),
                            confirm: TextButton(
                              onPressed: () {
                                controller.delete(item.id!);
                                Get.back();
                              },
                              child: Text('Deletar',
                                  style: TextStyleCustom.padraoText),
                            ),
                            cancel: TextButton(
                              onPressed: () => Get.back(),
                              child: Text('Cancelar',
                                  style: TextStyleCustom.padraoText),
                            ),
                          );
                        },
                        onCLik: () => Get.toNamed(
                          '/exerc',
                          preventDuplicates: true,
                          arguments: [
                            item.titulo,
                            item.prevDescricao,
                            item.execusao,
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
