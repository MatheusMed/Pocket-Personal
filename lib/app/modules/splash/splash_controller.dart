import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treinar_app/app/repository/database/sql_database.dart';
import 'package:treinar_app/app/repository/models/user_model.dart';

class SplashController extends GetxController {
  RxList<UserModel> listUser = RxList<UserModel>();

  late Database db;
  dadosPessoas() async {
    db = await SqlDatabase.instace.database;
    var user = await db.query('pessoa', orderBy: 'id');
    return user.isNotEmpty ? Get.offAllNamed('/home') : null;
  }

  void proxima() {
    Get.offAndToNamed('/welcome');
  }

  @override
  void onInit() {
    super.onInit();
    dadosPessoas();
    SystemChrome.setEnabledSystemUIOverlays([]);
  }
}
