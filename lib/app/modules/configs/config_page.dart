import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

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
                          Card(
                            color: AppColors.primary,
                            child: ListTile(
                              title: Text(
                                'Dados de Perfil',
                                textAlign: TextAlign.center,
                                style: TextStyleCustom.padraoBranco,
                              ),
                            ),
                          ),
                          ListtileCustom(
                            titulo: Text(
                              'Nome ${user.nome!.toUpperCase().trim()}',
                              style: TextStyleCustom.padraoBranco,
                            ),
                            subtitle: Text(
                              'Peso ${user.peso!.toUpperCase().trim()}',
                              style: TextStyleCustom.padraoBranco,
                            ),
                            trailing: Text(
                              'Altura ${user.altura!.toUpperCase().trim()}',
                              style: TextStyleCustom.padraoBranco,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: Get.height * .1 - 80),
              Card(
                color: AppColors.primary,
                child: ListTile(
                  title: Text(
                    'Adicionais',
                    textAlign: TextAlign.center,
                    style: TextStyleCustom.padraoBranco,
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
