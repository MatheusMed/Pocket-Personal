import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sqflite/sqflite.dart';
import 'package:treinar_app/app/repository/database/sql_database.dart';
import 'package:treinar_app/app/repository/models/exercicios_model.dart';
import 'package:treinar_app/app/repository/models/user_model.dart';

class WelcomeController extends GetxController {
  final formkey = GlobalKey<FormState>();

  final nomeC = TextEditingController();
  final alturaC = TextEditingController();
  final pesoC = TextEditingController();

  late Database db;

  RxList<UserModel> listUser = RxList<UserModel>();

  RxList<ExerciciosModel> listExeBasico = RxList<ExerciciosModel>(
    [
      ExerciciosModel(
        titulo: 'Agachamento',
        prevDescricao:
            'O agachamento é um exercício que irá ajudar a ficar com glúteos mais firmes e definidos, mas também pode trazer outros benefícios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
        execusao:
            'Fique de pé com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para trás como se estivesse sentando em uma cadeira. Volte à posição inicial, ficando de pé e repita o movimento 12 vezes de três a quatro séries.',
      ),
      ExerciciosModel(
          titulo: 'Prancha',
          prevDescricao:
              'Esse exercício é perfeito para fortalecer a região do core, ou seja, os músculos do abdômen, lombar e quadril. Ele ainda ajuda a melhorar a postura, reduzir os riscos de lesões e a desenvolver melhor desempenho em outros esportes.',
          execusao:
              'Deite no chão de barriga para baixo apoiando-se nos antebraços, eles precisam estar paralelos e afastados do ombro igualmente. Mantenha a palma da mão para baixo. Levante o quadril e deixe o corpo alinhado, mantendo o abdômen contraído e o peso nas pontas dos pés e antebraços. Permaneça na posição por pelo menos um minuto.'),
      ExerciciosModel(
        titulo: 'Afundo',
        prevDescricao:
            'Esse é outro exercício que ajuda a definir as coxas e os glúteos, mas um pouco mais intenso que o agachamento. Ele é perfeito para quem busca definir a parte inferior do corpo e praticantes de esportes como corrida, futebol e basquete, pois ajuda a fortalecer as penas e prevenir lesões.',
        execusao:
            'Fique de pé e dê um passo à frente somente com uma das pernas de forma que, ao flexionar os joelhos, a perna de trás forme um ângulo de 90º. Flexione o joelho da perna a frente e desça até o joelho da perna de trás quase tocar o chão. Volte à posição inicial sem estender completamente a posição do corpo para não tirar a tensão dos músculos. Repita pelo menos 12 vezes com cada perna em, no mínimo, duas séries.',
      ),
      ExerciciosModel(
        titulo: 'Pular corda',
        prevDescricao:
            'Sim, a famosa brincadeira de criança traz benefícios para o corpo, e não são poucos. Pular corda melhora o condicionamento físico, queima calorias, promove sensação de bem-estar, colabora com o desenvolvimento de coordenação motora e equilíbrio, aperfeiçoa a capacidade cardiorrespiratória e muito mais.',
        execusao:
            'Com uma corda nas mãos, deixe os pés alinhados e dê pulinhos para passar por cima da corda quando ela estiver próxima dos pés. Inicialmente, pule por um minuto e descanse por um minuto.',
      ),
      ExerciciosModel(
        titulo: 'Polichinelo',
        prevDescricao:
            'O polichinelo auxilia no condicionamento físico e cardiovascular, queima calorias e melhora a coordenação motora. É ótimo como aquecimento antes de iniciar exercícios mais pesados',
        execusao:
            'De pé, com os braços ao lado do corpo, efetue um pequeno salto movendo as mãos como se fosse bater palma acima da cabeça ao mesmo tempo que afasta as pernas lateralmente. Volte à posição inicial e repita o movimento em três séries de 15.',
      ),
      ExerciciosModel(
        titulo: 'Marcha estacionária',
        prevDescricao:
            'A corrida estacionária é outro exercício muito bom para aquecimento, mas também proporciona seus benefícios. Ela ajuda a queimar calorias e colabora com a definição do abdômen, pernas e bumbum.',
        execusao:
            'Para fazer esse exercício, basta simular uma corrida sem sair do lugar. É indicado cinco séries de três minutos cada.',
      ),
    ],
  );

  final box = GetStorage();

  RxInt numberValue0 = 1.obs;
  RxInt numberValue1 = 2.obs;
  RxInt numberValue2 = 3.obs;

  RxInt selectedValue = 0.obs;

  pressRadioBtn(value) async {
    var selecionad = selectedValue.value = value;
    await box.write('key', selecionad);
  }

  // RxList exerciciosBasico = [
  //   'Flexão de braço',
  //   'Flexão de braço inclinada',
  //   'Rosca martelo',
  //   'Rosca direta',
  //   'Rosca direta sentado',
  //   'Prancha de antebraço',
  //   'Rosca bíceps direta com barra',
  //   'Rosca bíceps direta com barra e pegada ampla',
  //   'Rosca bíceps direta com halteres',
  //   'Rosca bíceps martelo em pé com halteres',
  //   'Rosca bíceps em pé na barra EZ',
  //   'Rosca bíceps no cabo e usando a corda',
  //   'Rosca bíceps direta com barra e pegada ampla',
  //   'Rosca bíceps direta com halteres',
  //   'Rosca bíceps martelo em pé com halteres',
  //   'Rosca bíceps em pé na barra EZ',
  //   'Rosca bíceps no cabo e usando a corda',
  //   'Rosca bíceps direta com barra e pegada ampla',
  //   'Rosca bíceps direta com halteres',
  // ].obs;

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

  @override
  void onReady() {
    selectedValue.value = box.read('key');
    super.onReady();
  }
}
