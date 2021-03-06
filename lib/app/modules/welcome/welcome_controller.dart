import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:sqflite/sqflite.dart';
import 'package:treinar_app/app/repository/database/sql_database.dart';
import 'package:treinar_app/app/repository/models/exercicios_model.dart';
import 'package:treinar_app/app/repository/models/type_exercicios.dart';
import 'package:treinar_app/app/repository/models/user_model.dart';
import 'package:treinar_app/app/shared/themes/app_colors.dart';

import 'package:treinar_app/app/shared/themes/text_style_custom.dart';
import 'package:treinar_app/app/shared/widgets/button_custom/buttom_custom.dart';
import 'package:treinar_app/app/shared/widgets/listTile_custom/listTile_custom.dart';

class WelcomeController extends GetxController {
  final formkey = GlobalKey<FormState>();

  final nomeC = TextEditingController();
  final alturaC = TextEditingController();
  final pesoC = TextEditingController();

  late Database db;

  RxBool? valor = false.obs;

  alterar(value) async {
    var selecionado = valor!.value = value;
    await box.write('box', selecionado);
  }

  showModal() {
    Get.bottomSheet(
      Container(
        height: Get.height * .25,
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Deseja continua o processo?',
              style: TextStyleCustom.minimoTitle,
            ),
            ListtileCustom(
              onCLik: () {},
              titulo: Text('Sim', style: TextStyleCustom.padraoBranco),
            ),
            ListtileCustom(
              onCLik: () => Get.back(),
              titulo: Text('Nao', style: TextStyleCustom.padraoBranco),
            ),
          ],
        ),
      ),
      backgroundColor: AppColors.purpleLightOne,
    );
  }

  RxList<UserModel> listUser = RxList<UserModel>();

  // List<String?> get titulos => tipoDeExericicoBasico
  //     .map(
  //         (tipo) => tipo.listaExercicios!.map((exercicio) => exercicio!.titulo))
  //     .expand((exercicios) => exercicios)
  //     .toList();

  RxList<TypeExercicios> tipoDeExericicoBasico = RxList<TypeExercicios>(
    [
      TypeExercicios(
        tipo: 'Abdomen',
        listaExercicios: [
          ExerciciosModel(
            titulo: 'abdomen',
            prevDescricao:
                'O agachamento ?? um exerc??cio que ir?? ajudar a ficar com gl??teos mais firmes e definidos, mas tamb??m pode trazer outros benef??cios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
            execusao:
                'Fique de p?? com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para tr??s como se estivesse sentando em uma cadeira. Volte ?? posi????o inicial, ficando de p?? e repita o movimento 12 vezes de tr??s a quatro s??ries.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'abdmen',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'Esse ?? outro exerc??cio que ajuda a definir as coxas e os gl??teos, mas um pouco mais intenso que o agachamento. Ele ?? perfeito para quem busca definir a parte inferior do corpo e praticantes de esportes como corrida, futebol e basquete, pois ajuda a fortalecer as penas e prevenir les??es.',
            execusao:
                'Fique de p?? e d?? um passo ?? frente somente com uma das pernas de forma que, ao flexionar os joelhos, a perna de tr??s forme um ??ngulo de 90??. Flexione o joelho da perna a frente e des??a at?? o joelho da perna de tr??s quase tocar o ch??o. Volte ?? posi????o inicial sem estender completamente a posi????o do corpo para n??o tirar a tens??o dos m??sculos. Repita pelo menos 12 vezes com cada perna em, no m??nimo, duas s??ries.',
          ),
          ExerciciosModel(
            titulo: 'abdmen',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'O polichinelo auxilia no condicionamento f??sico e cardiovascular, queima calorias e melhora a coordena????o motora. ?? ??timo como aquecimento antes de iniciar exerc??cios mais pesados',
            execusao:
                'De p??, com os bra??os ao lado do corpo, efetue um pequeno salto movendo as m??os como se fosse bater palma acima da cabe??a ao mesmo tempo que afasta as pernas lateralmente. Volte ?? posi????o inicial e repita o movimento em tr??s s??ries de 15.',
          ),
        ],
      ),
      TypeExercicios(
        tipo: 'Ombro',
        listaExercicios: [
          ExerciciosModel(
            titulo: 'Shoulder Press com Halteres Fixos',
            prevDescricao:
                'A execu????o do exerc??cio com as palmas das m??os voltadas para dentro far?? com que o deltoide anterior trabalhe mais, o que minimiza a atua????o do deltoide lateral. Caso execute o shoulder press com a palma das m??os viradas para tr??s, trabalhar?? mais o deltoide anterior.',
            execusao:
                '''Sente-se num banco e coloque os halteres de forma com que o seu bra??o e antebra??o formem um ??ngulo de 90 graus.
                  As palmas das m??os devem estar voltadas para a frente. Levante os halteres at?? ficar com os bra??os esticados. Retorne ?? posi????o inicial As costas devem estar sempre eretas.
                M??sculos trabalhados com mais ??nfase:
                Prim??rio: deltoide anterior
                Secund??rios: deltoide lateral, tr??ceps, trap??zio e peitoral superior.''',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Levantamento Lateral com Halteres Fixos',
            prevDescricao:
                'Quando os halteres s??o levantados at?? o n??vel do ombro, o deltoide lateral executa a maior parte do trabalho.',
            execusao: '''
                De p??, segure os halteres com os bra??os estendidos, um de cada lado. Eleve os bra??os para fora at?? que os halteres atinjam o n??vel dos ombros. Regresse lentamente ?? posi????o inicial.
                M??sculos trabalhados com mais ??nfase:
                Prim??rio: deltoide lateral
                Secund??rios: deltoide anterior, deltoide posterior, trap??zio e supra espinal
                 ''',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Polichinelo',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'O polichinelo auxilia no condicionamento f??sico e cardiovascular, queima calorias e melhora a coordena????o motora. ?? ??timo como aquecimento antes de iniciar exerc??cios mais pesados',
            execusao:
                'De p??, com os bra??os ao lado do corpo, efetue um pequeno salto movendo as m??os como se fosse bater palma acima da cabe??a ao mesmo tempo que afasta as pernas lateralmente. Volte ?? posi????o inicial e repita o movimento em tr??s s??ries de 15.',
          ),
        ],
      ),
      TypeExercicios(
        tipo: 'Perna',
        listaExercicios: [
          ExerciciosModel(
            titulo: 'Eleva????o de g??meos',
            prevDescricao:
                'Com uma m??o, agarre um halter e mantenha-o a um lado do corpo. Posicione a ponta dos p??s no bloco da m??quina com o arco dos p??s e os calcanhares do lado de fora. Coloque e apoie a m??o livre numa estrutura fixa. Mantenha-se ereto estendendo os quadris e joelho.',
            execusao:
                'A eleva????o de g??meos ?? um exerc??cio que trabalha as panturrilhas. Esse treino consiste em se posicionar sobre um step ou degrau de escada na ponta dos p??s e fazer o movimento de descer e subir. Para potencializar a ativa????o, pode-se usar caneleiras.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Cadeira adutora e abdutora',
            prevDescricao:
                'O treino feito na cadeira adutora serve para ativar os m??sculos adutores, ou seja, do interior da perna. Essa ?? uma ??rea que costuma acumular bastante gordura, principalmente nas mulheres e, por isso, o seu fortalecimento, al??m de deixar o aspecto da coxa mais bonito, tamb??m garante maior estabilidade.',
            execusao:
                'J?? a execu????o na cadeira abdutora consiste em trabalhar a parte lateral da coxa, deixando a perna mais torneada e ajudando ao corpo a se manter est??vel durante outros exerc??cios.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Agachamento',
            prevDescricao:
                'O agachamento ?? um exerc??cio que ir?? ajudar a ficar com gl??teos mais firmes e definidos, mas tamb??m pode trazer outros benef??cios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
            execusao:
                'Fique de p?? com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para tr??s como se estivesse sentando em uma cadeira. Volte ?? posi????o inicial, ficando de p?? e repita o movimento 12 vezes de tr??s a quatro s??ries.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Afundo',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'Esse ?? outro exerc??cio que ajuda a definir as coxas e os gl??teos, mas um pouco mais intenso que o agachamento. Ele ?? perfeito para quem busca definir a parte inferior do corpo e praticantes de esportes como corrida, futebol e basquete, pois ajuda a fortalecer as penas e prevenir les??es.',
            execusao:
                'Fique de p?? e d?? um passo ?? frente somente com uma das pernas de forma que, ao flexionar os joelhos, a perna de tr??s forme um ??ngulo de 90??. Flexione o joelho da perna a frente e des??a at?? o joelho da perna de tr??s quase tocar o ch??o. Volte ?? posi????o inicial sem estender completamente a posi????o do corpo para n??o tirar a tens??o dos m??sculos. Repita pelo menos 12 vezes com cada perna em, no m??nimo, duas s??ries.',
          ),
          ExerciciosModel(
            titulo: 'Polichinelo',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'O polichinelo auxilia no condicionamento f??sico e cardiovascular, queima calorias e melhora a coordena????o motora. ?? ??timo como aquecimento antes de iniciar exerc??cios mais pesados',
            execusao:
                'De p??, com os bra??os ao lado do corpo, efetue um pequeno salto movendo as m??os como se fosse bater palma acima da cabe??a ao mesmo tempo que afasta as pernas lateralmente. Volte ?? posi????o inicial e repita o movimento em tr??s s??ries de 15.',
          ),
        ],
      ),
    ],
  );

  RxList<ExerciciosModel> listExeBasicoPerna = RxList<ExerciciosModel>(
    [
      ExerciciosModel(
        titulo: 'Agachamento',
        prevDescricao:
            'O agachamento ?? um exerc??cio que ir?? ajudar a ficar com gl??teos mais firmes e definidos, mas tamb??m pode trazer outros benef??cios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
        execusao:
            'Fique de p?? com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para tr??s como se estivesse sentando em uma cadeira. Volte ?? posi????o inicial, ficando de p?? e repita o movimento 12 vezes de tr??s a quatro s??ries.',
        imagem: 'assets/animation/padrao.json',
      ),
      ExerciciosModel(
        titulo: 'Afundo',
        imagem: 'assets/animation/padrao.json',
        prevDescricao:
            'Esse ?? outro exerc??cio que ajuda a definir as coxas e os gl??teos, mas um pouco mais intenso que o agachamento. Ele ?? perfeito para quem busca definir a parte inferior do corpo e praticantes de esportes como corrida, futebol e basquete, pois ajuda a fortalecer as penas e prevenir les??es.',
        execusao:
            'Fique de p?? e d?? um passo ?? frente somente com uma das pernas de forma que, ao flexionar os joelhos, a perna de tr??s forme um ??ngulo de 90??. Flexione o joelho da perna a frente e des??a at?? o joelho da perna de tr??s quase tocar o ch??o. Volte ?? posi????o inicial sem estender completamente a posi????o do corpo para n??o tirar a tens??o dos m??sculos. Repita pelo menos 12 vezes com cada perna em, no m??nimo, duas s??ries.',
      ),
      ExerciciosModel(
        titulo: 'Pular corda',
        prevDescricao:
            'Sim, a famosa brincadeira de crian??a traz benef??cios para o corpo, e n??o s??o poucos. Pular corda melhora o condicionamento f??sico, queima calorias, promove sensa????o de bem-estar, colabora com o desenvolvimento de coordena????o motora e equil??brio, aperfei??oa a capacidade cardiorrespirat??ria e muito mais.',
        execusao:
            'Com uma corda nas m??os, deixe os p??s alinhados e d?? pulinhos para passar por cima da corda quando ela estiver pr??xima dos p??s. Inicialmente, pule por um minuto e descanse por um minuto.',
      ),
      ExerciciosModel(
        titulo: 'Polichinelo',
        imagem: 'assets/animation/padrao.json',
        prevDescricao:
            'O polichinelo auxilia no condicionamento f??sico e cardiovascular, queima calorias e melhora a coordena????o motora. ?? ??timo como aquecimento antes de iniciar exerc??cios mais pesados',
        execusao:
            'De p??, com os bra??os ao lado do corpo, efetue um pequeno salto movendo as m??os como se fosse bater palma acima da cabe??a ao mesmo tempo que afasta as pernas lateralmente. Volte ?? posi????o inicial e repita o movimento em tr??s s??ries de 15.',
      ),
      ExerciciosModel(
        titulo: 'Marcha estacion??ria',
        imagem: 'assets/animation/padrao.json',
        prevDescricao:
            'A corrida estacion??ria ?? outro exerc??cio muito bom para aquecimento, mas tamb??m proporciona seus benef??cios. Ela ajuda a queimar calorias e colabora com a defini????o do abd??men, pernas e bumbum.',
        execusao:
            'Para fazer esse exerc??cio, basta simular uma corrida sem sair do lugar. ?? indicado cinco s??ries de tr??s minutos cada.',
      ),
    ],
  );

  final box = GetStorage();

  RxInt numberValue0 = 1.obs;
  RxInt numberValue1 = 2.obs;
  RxInt numberValue2 = 3.obs;

  RxInt? selectedValue = 0.obs;

  pressRadioBtn(value) async {
    var selecionad = selectedValue!.value = value;
    await box.write('key', selecionad);
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

  close() {
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
              onCLik: () async {
                db = await SqlDatabase.instace.database;
                await db.delete(
                  'pessoa',
                );
                Get.offAllNamed('/splash');
              },
              titulo: Text(
                'Apagar seu dados',
                style: TextStyleCustom.titleRadio,
              ),
            ),
            ListtileCustom(
              elevation: 0,
              color: AppColors.branco,
              onCLik: () => Get.back(),
              titulo: Text(
                'N??o apagar seu dados',
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

  validade() {
    var formValidade = formkey.currentState?.validate() ?? false;
    if (formValidade) {
      criarUser();
    }
  }

  void criarUser() {
    add(
      UserModel(
        nome: nomeC.text.trim(),
        peso: int.parse(pesoC.text),
        altura: alturaC.text,
        resultado: int.parse(pesoC.text) /
            (double.parse(alturaC.text) * double.parse(alturaC.text)),
      ),
    );
    nomeC.clear();
    pesoC.clear();
    alturaC.clear();
    dadosPessoas();
    Get.offAllNamed('/pageView');
  }

  @override
  void onInit() {
    super.onInit();
    dadosPessoas();
  }

  @override
  void onReady() {
    selectedValue!.value = box.read('key');
    valor!.value = box.read('box');
    super.onReady();
  }
}
