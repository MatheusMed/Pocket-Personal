import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treinar_app/app/repository/database/sql_database.dart';
import 'package:treinar_app/app/repository/models/exercicios_custom.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';
import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/button_custom/buttom_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class AdcionarExerController extends GetxController {
  final formKey = GlobalKey<FormState>();

  late Database db;

  RxBool lista = false.obs;

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

  void showModalDelete(int id) {
    Get.bottomSheet(
      Container(
        height: Get.height * .30,
        width: Get.width,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Selecionar',
              style: TextStyleCustom.titleRadio,
              textAlign: TextAlign.center,
            ),
            ListtileCustom(
              elevation: 0,
              color: AppColors.branco,
              onCLik: () {
                delete(id);
                Get.back();
              },
              titulo: Text(
                'Excluir exercicio',
                style: TextStyleCustom.titleRadio,
              ),
            ),
            ListtileCustom(
              elevation: 0,
              color: AppColors.branco,
              onCLik: () => Get.back(),
              titulo: Text(
                'Não excluir exercicio',
                style: TextStyleCustom.titleRadio,
              ),
            ),
            ButtomCustom(
              onClik: () => Get.back(),
              widget: Text('Cancelar', style: TextStyleCustom.padraoBranco),
            )
          ],
        ),
      ),
      backgroundColor: AppColors.branco,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
    );
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
