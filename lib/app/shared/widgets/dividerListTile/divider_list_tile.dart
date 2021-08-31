import 'package:flutter/material.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class DividerListTile extends StatelessWidget {
  final String? titulo;
  final Widget? trailing;

  DividerListTile({this.titulo, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      child: ListTile(
        title: Text(
          titulo!,
          textAlign: TextAlign.center,
          style: TextStyleCustom.padraoBranco,
        ),
        trailing: trailing,
      ),
    );
  }
}
