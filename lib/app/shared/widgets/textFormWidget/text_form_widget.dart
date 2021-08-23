import 'package:flutter/material.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class TextFormWidget extends StatelessWidget {
  final String? titulo;
  TextEditingController? controlador;

  TextFormWidget({this.titulo, this.controlador});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.purpleLight,
      ),
      child: TextFormField(
        controller: controlador,
        decoration: InputDecoration(
          labelText: titulo,
          labelStyle: TextStyleCustom.padrao,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
        ),
      ),
    );
  }
}
