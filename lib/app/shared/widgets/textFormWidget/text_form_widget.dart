import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

// ignore: must_be_immutable
class TextFormWidget extends StatelessWidget {
  final String? titulo;
  TextEditingController? controlador;
  String? Function(String?)? validator;
  TextInputType? tipoDeTeclado;
  List<TextInputFormatter>? inputFormatters;

  TextFormWidget(
      {this.titulo,
      this.controlador,
      this.validator,
      this.tipoDeTeclado,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.purpleLight,
      ),
      child: TextFormField(
        validator: validator,
        inputFormatters: inputFormatters,
        controller: controlador,
        maxLines: null,
        autocorrect: false,
        cursorColor: AppColors.primary,
        keyboardType: tipoDeTeclado,
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
