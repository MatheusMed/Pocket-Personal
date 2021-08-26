import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import 'package:treinar_app/app/modules/exerciciosCustoms/exercicios_custom_page.dart';
import 'package:treinar_app/app/modules/home/home_page.dart';
import 'package:treinar_app/app/modules/nutricao/nutricao_page.dart';
import 'package:treinar_app/app/modules/pageView/page_view_controller.dart';

import 'package:treinar_app/app/shared/themes/app_colors.dart';

class PageViewHome extends GetView<PageViewController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pc,
        children: [
          HomePage(),
          ExerciciosCustomPage(),
          NutricaoPage(),
        ],
        onPageChanged: controller.setPaginaAtual,
      ),
      bottomNavigationBar: Obx(
        () {
          return BottomNavigationBar(
            currentIndex: controller.paginaAtual.value,
            onTap: (pagina) => controller.switchPageBar(pagina),
            selectedItemColor: AppColors.primary,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.list_alt,
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
                label: 'Alimentação',
              ),
            ],
          );
        },
      ),
    );
  }
}
