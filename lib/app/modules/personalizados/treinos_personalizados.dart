import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/widgets/app_bar_custom/app_bar_custom.dart';

class TreinosPersonalizados extends StatelessWidget {
  const TreinosPersonalizados({Key? key}) : super(key: key);

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
          height: Get.height,
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AppBarCustom(
                  titulo: 'Personalizados',
                  trailing: Icon(
                    CommunityMaterialIcons.puzzle_check_outline,
                    size: 32,
                    color: AppColors.branco,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
