import 'package:flutter/material.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';

class NutricaoPage extends StatelessWidget {
  const NutricaoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('em breve'),
      ),
      body: Center(
          child: Container(
        child: Text(
          'EM BREVE..',
          style: TextStyleCustom.title,
        ),
      )),
    );
  }
}
