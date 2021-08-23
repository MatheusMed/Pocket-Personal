import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/repository/models/user_model.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class HomePage extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return ListView.builder(
        itemCount: controller.listUser.length,
        itemBuilder: (contx, i) {
          UserModel user = controller.listUser[i];
          return Column(
            children: [
              Container(
                child: Text(
                  'Ola ${user.nome}',
                  style: TextStyleCustom.padrao,
                ),
              ),
            ],
          );
        },
      );
    }));
  }
}
