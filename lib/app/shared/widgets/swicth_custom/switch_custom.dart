import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treinar_app/app/modules/welcome/welcome_controller.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';

class SwitchCustom extends GetView<WelcomeController> {
  final bool value;
  final void Function(bool)? onChanged;

  SwitchCustom({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: controller.valor!.value == false
              ? AppColors.purpleLightOne
              : AppColors.primary,
        ),
        child: SizedBox(
          height: 30,
          width: 55,
          child: Switch.adaptive(
            activeTrackColor: AppColors.transparent,
            inactiveTrackColor: AppColors.transparent,
            activeColor: AppColors.cinzaClaro,
            inactiveThumbColor: AppColors.primarylight,
            value: value,
            onChanged: onChanged,
          ),
        ),
      ),
    );
  }
}
