import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/dividerListTile/divider_list_tile.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';
import 'package:treinar_app/app/shared/widgets/swicth_custom/switch_custom.dart';

class ConfigPage extends GetResponsiveView<WelcomeController> {
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
                    'Configurações',
                    style: TextStyleCustom.textBtn,
                  ),
                  leading: IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.branco,
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * .1 - 60),
              SizedBox(
                height: Get.height * .1 + 61,
                width: Get.width * 1,
                child: Obx(
                  () => ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listUser.length,
                    itemBuilder: (_, i) {
                      final user = controller.listUser[i];
                      return Column(
                        children: [
                          DividerListTile(
                            titulo: 'Dados do perfil',
                            trailing: Icon(
                              Icons.person,
                              color: AppColors.branco,
                            ),
                          ),
                          ListtileCustom(
                            titulo: Text(
                              'Nome: ${user.nome}',
                              style: TextStyleCustom.padraoBranco,
                            ),
                            subtitle: Text(
                              'Peso: ${user.peso!}',
                              style: TextStyleCustom.padraoBranco,
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Altura: ${user.altura!}',
                                  style: TextStyleCustom.padraoBranco,
                                ),
                                Text(
                                  'IMC: ${user.resultado!.toStringAsFixed(4).replaceAll('0', '').replaceAll('.', '')}',
                                  style: TextStyleCustom.padraoBranco,
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: Get.height * .1 - 80),
              DividerListTile(
                titulo: 'Adicionais',
                trailing: Icon(
                  Icons.settings,
                  color: AppColors.branco,
                ),
              ),
              SizedBox(height: Get.height * .1 - 80),
              ListtileCustom(
                // onCLik: () => controller.close(),
                titulo: Text(
                  'Treinos Personalizados por nossa equipe',
                  style: TextStyleCustom.padraoBranco,
                ),

                trailing: Obx(
                  () => SwitchCustom(
                    onChanged: (value) => controller.alterar(value),
                    value: controller.valor!.value,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
