import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/adicionarExercicio/adicionar_exercicio.dart';
import 'package:treinar_app/app/modules/configs/config_page.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/repository/models/user_model.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/RadioButtonWidget/radio_button_widget.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class HomePage extends GetResponsiveView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          toolbarHeight: 0,
          brightness: Brightness.dark,
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => Get.to(
            () => AdicionarExercicio(),
            fullscreenDialog: true,
            preventDuplicates: true,
          ),
          backgroundColor: AppColors.primary,
          child: Icon(Icons.add),
        ),
        body: Obx(() {
          return ListView.builder(
            itemCount: controller.listUser.length,
            itemBuilder: (contx, i) {
              UserModel user = controller.listUser[i];
              return Column(
                children: [
                  AppBarCustom(
                    titulo: 'Bem vindo(a) ${user.nome!.trim()}',
                    trailing: IconButton(
                      onPressed: () {
                        Get.to(() => ConfigPage(), fullscreenDialog: true);
                      },
                      icon: Icon(
                        CommunityMaterialIcons.cog_outline,
                        color: AppColors.branco,
                        size: 30,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: Get.height * 0.1 - 60),
                      Text(
                        'Selecione o nivel para os exercicios',
                        style: TextStyleCustom.titleRadio,
                        textAlign: TextAlign.center,
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RadioButtonWidget(
                                valor: controller.numberValue0.value,
                                valorGrupo: controller.selectedValue!.value,
                                funcao: (value) =>
                                    controller.pressRadioBtn(value)),
                            Text('Iniciante', style: TextStyleCustom.padrao),
                            RadioButtonWidget(
                                valor: controller.numberValue1.value,
                                valorGrupo: controller.selectedValue!.value,
                                funcao: (value) =>
                                    controller.pressRadioBtn(value)),
                            Text('Ja faz Exercicios',
                                style: TextStyleCustom.padrao),
                            RadioButtonWidget(
                                valor: controller.numberValue2.value,
                                valorGrupo: controller.selectedValue!.value,
                                funcao: (value) =>
                                    controller.pressRadioBtn(value)),
                            Text('Try Hard', style: TextStyleCustom.padrao),
                          ],
                        );
                      }),
                      Obx(() => controller.selectedValue!.value == 0
                          ? SizedBox(
                              height: Get.height * .7,
                              child: Center(
                                child: Text(
                                  'Nenhum nivel selecionado',
                                  style: TextStyleCustom.title,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            )
                          : Container()),
                      Obx(
                        () => controller.selectedValue!.value == 1
                            ? SizedBox(
                                height: Get.height * .7,
                                width: Get.width * .96,
                                child: ListView.separated(
                                  separatorBuilder: (_, __) => Divider(
                                    thickness: 2,
                                    height: 20,
                                    color: AppColors.primaryBase,
                                  ),
                                  shrinkWrap: true,
                                  itemCount: controller.listExeBasico.length,
                                  itemBuilder: (context, i) {
                                    final nome = controller.listExeBasico[i];
                                    return ListtileCustom(
                                      titulo: Text(nome.titulo!,
                                          style: TextStyleCustom.padraoBranco),
                                      trailing: Icon(
                                        Icons.arrow_forward_ios,
                                        color: AppColors.branco,
                                      ),
                                      onCLik: () => Get.toNamed(
                                        '/exerc',
                                        preventDuplicates: true,
                                        arguments: [
                                          nome.titulo,
                                          nome.prevDescricao,
                                          nome.execusao,
                                          nome.imagem,
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                      ),
                    ],
                  )
                ],
              );
            },
          );
        }));
  }
}
