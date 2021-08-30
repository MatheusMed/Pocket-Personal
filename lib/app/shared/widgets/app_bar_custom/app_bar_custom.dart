import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class AppBarCustom extends StatelessWidget {
  final String titulo;

  final Widget? trailing;

  final Widget? leading;

  AppBarCustom({this.leading, required this.titulo, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        trailing: trailing,
        leading: leading,
        title: Text(
          titulo,
          style: TextStyleCustom.textBtn,
        ),
      ),
    );
  }
}
