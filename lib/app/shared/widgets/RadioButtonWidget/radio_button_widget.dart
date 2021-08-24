import 'package:flutter/material.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';

class RadioButtonWidget extends StatelessWidget {
  dynamic valor;
  dynamic valorGrupo;
  void Function(dynamic)? funcao;

  RadioButtonWidget({
    required this.valor,
    required this.valorGrupo,
    required this.funcao,
  });

  @override
  Widget build(BuildContext context) {
    return Radio(
      value: valor,
      groupValue: valorGrupo,
      activeColor: AppColors.primary,
      onChanged: funcao,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
