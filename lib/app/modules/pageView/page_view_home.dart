import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:treinar_app/app/modules/exerciciosCustoms/exercicios_custom_page.dart';
import 'package:treinar_app/app/modules/home/home_page.dart';
import 'package:treinar_app/app/modules/nutricao/nutricao_page.dart';
import 'package:treinar_app/app/modules/pageView/page_view_controller.dart';
import 'package:treinar_app/app/modules/personalizados/treinos_personalizados.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';

import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class PageViewHome extends GetView<PageViewController> {
  final welcomeController = Get.find<WelcomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pc,
        children: [
          HomePage(),
          ExerciciosCustomPage(),
          NutricaoPage(),
          Obx(
            () => welcomeController.valor!.value == true
                ? TreinosPersonalizados()
                : Center(
                    child: Text(
                      'Ative em configuraçoes',
                      style: TextStyleCustom.title,
                      textAlign: TextAlign.center,
                    ),
                  ),
          ),
        ],
        onPageChanged: controller.setPaginaAtual,
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: controller.paginaAtual.value,
            onTap: (pagina) => controller.switchPageBar(pagina),
            selectedItemColor: AppColors.primary,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  CommunityMaterialIcons.format_list_bulleted,
                  size: 26,
                ),
                label: 'Exercios',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CommunityMaterialIcons.puzzle,
                  size: 26,
                ),
                label: 'Customizados',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CommunityMaterialIcons.food_apple,
                  size: 26,
                ),
                label: 'Nutriçao',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  CommunityMaterialIcons.puzzle_check_outline,
                  size: 26,
                ),
                label: 'Personalizados',
              ),
            ],
          );
        },
      ),
    );
  }
}
