import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treinar_app/app/repository/database/sql_database.dart';
import 'package:treinar_app/app/repository/models/exercicios_custom.dart';

class AdcionarExerController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late Database db;

  RxList<ExerciciosCustom> listExercicios = RxList<ExerciciosCustom>();

  final tituloC = TextEditingController();
  final prevDescC = TextEditingController();
  final execusaoC = TextEditingController();

  void validacaoExercicicioCustom() {
    var formValidade = formKey.currentState?.validate() ?? false;
    if (formValidade) {
      criarNovoExercicio();
    }
  }

  void criarNovoExercicio() {
    add(
      ExerciciosCustom(
        titulo: tituloC.text,
        prevDescricao: prevDescC.text,
        execusao: execusaoC.text,
      ),
    );
    tituloC.clear();
    prevDescC.clear();
    execusaoC.clear();
    getAllNovasNotas();
    Get.offAllNamed('/pageView');
  }

  Future<List<ExerciciosCustom>?> getAllNovasNotas() async {
    db = await SqlDatabase.instace.database;
    var exercicios = await db.query(
      'exercicio',
    );
    listExercicios.value = exercicios.isNotEmpty
        ? exercicios.map((res) => ExerciciosCustom.fromMap(res)).toList()
        : [];
    return listExercicios;
  }

  Future<int?> add(ExerciciosCustom exerciciosCustom) async {
    db = await SqlDatabase.instace.database;
    return await db.insert('exercicio', exerciciosCustom.toMap());
  }

  Future<int> delete(int id) async {
    db = await SqlDatabase.instace.database;
    var delet = await db.delete('exercicio', where: 'id = ?', whereArgs: [id]);
    getAllNovasNotas();
    return delet;
  }

  @override
  void onInit() {
    getAllNovasNotas();
    super.onInit();
  }
}
