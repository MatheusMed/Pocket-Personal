import 'package:flutter/material.dart';

import 'package:treinar_app/app/shared/themes/app_colors.dart';

class ListtileCustom extends StatelessWidget {
  final Widget? titulo;
  final void Function()? onCLik;
  final void Function()? onLongPress;
  final Widget? trailing;
  final Widget? leading;
  final Widget? subtitle;
  final Color? color;
  double? elevation;

  ListtileCustom({
    this.titulo,
    this.onCLik,
    this.trailing,
    this.leading,
    this.subtitle,
    this.onLongPress,
    this.color,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation == null ? 1 : elevation,
      color: color == null ? AppColors.primarylight : color,
      child: ListTile(
        title: titulo,
        subtitle: subtitle,
        trailing: trailing,
        leading: leading,
        onTap: onCLik,
        onLongPress: onLongPress,
      ),
    );
  }
}
