import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class NutricaoPage extends StatelessWidget {
  final controlador = Get.find<WelcomeController>();
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
            AppBarCustom(
              titulo: 'Nutricão',
              trailing: Icon(
                CommunityMaterialIcons.food_apple,
                size: 32,
                color: AppColors.branco,
              ),
            ),
            SizedBox(
              height: Get.height,
              width: Get.width,
              child: Obx(
                () => ListView.builder(
                  itemBuilder: (_, i) {
                    final user = controlador.listUser[i];
                    return Column(
                      children: [
                        ListtileCustom(
                          titulo: Text(
                            'Seu IMC atualmente: ${user.resultado!.toStringAsFixed(1)}',
                            style: TextStyleCustom.padraoBranco,
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: controlador.listUser.length,
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
