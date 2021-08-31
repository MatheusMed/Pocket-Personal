import 'package:flutter/material.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';

class DividerListTile extends StatelessWidget {
  final Widget? titulo;
  final Widget? trailing;

  DividerListTile({this.titulo, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.primary,
      child: ListTile(
        title: titulo,
        trailing: trailing,
      ),
    );
  }
}
