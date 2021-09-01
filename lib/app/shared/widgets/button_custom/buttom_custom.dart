import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';

class ButtomCustom extends StatelessWidget {
  final void Function() onClik;
  final Widget widget;

  const ButtomCustom({Key? key, required this.onClik, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * .85,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primarylight,
      ),
      child: TextButton(
        onPressed: onClik,
        child: widget,
      ),
    );
  }
}
