import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treinar_app/app/repository/database/sql_database.dart';
import 'package:treinar_app/app/repository/models/user_model.dart';

class WelcomeController extends GetxController {
  final formkey = GlobalKey<FormState>();

  final nomeC = TextEditingController();
  final alturaC = TextEditingController();
  final pesoC = TextEditingController();

  late Database db;

  RxList<UserModel> listUser = RxList<UserModel>();

  RxInt numberValue0 = 0.obs;
  RxInt numberValue1 = 1.obs;
  RxInt numberValue2 = 2.obs;

  RxInt selectedValue = 0.obs;

  void pressRadioButon(value) {
    selectedValue.value = value;
    print("valor $value");
  }

  Future<List<UserModel>> dadosPessoas() async {
    db = await SqlDatabase.instace.database;
    var user = await db.query('pessoa', orderBy: 'id');
    listUser.value =
        user.isNotEmpty ? user.map((e) => UserModel.fromMap(e)).toList() : [];
    return listUser;
  }

  Future<int?> add(UserModel user) async {
    db = await SqlDatabase.instace.database;
    return await db.insert('pessoa', user.toMap());
  }

  validade() {
    var formValidade = formkey.currentState?.validate() ?? false;
    if (formValidade) {
      criarUser();
    }
  }

  void criarUser() {
    add(
      UserModel(
        nome: nomeC.text,
        peso: pesoC.text,
        altura: alturaC.text,
      ),
    );
    nomeC.clear();
    pesoC.clear();
    alturaC.clear();
    dadosPessoas();
    Get.offAllNamed('/home');
  }

  @override
  void onInit() {
    super.onInit();
    dadosPessoas();
  }
}
