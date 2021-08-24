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

    if (user.isEmpty) {
      Get.offAndToNamed('/welcome');
    } else if (user.isNotEmpty) {
      Get.offAndToNamed('/home');
    }
  }
}
