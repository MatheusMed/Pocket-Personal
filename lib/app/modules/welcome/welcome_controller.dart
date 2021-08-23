import 'package:flutter/material.dart';

import 'package:get/get.dart';

class WelcomeController extends GetxController {
  final formkey = GlobalKey<FormState>();

  RxInt numberValue0 = 0.obs;
  RxInt numberValue1 = 1.obs;
  RxInt numberValue2 = 2.obs;

  RxInt selectedValue = 0.obs;

  void pressRadioButon(value) {
    selectedValue.value = value;
    print("valor $value");
  }

  final nomeC = TextEditingController();
  final alturaC = TextEditingController();
  final pesoC = TextEditingController();
}
