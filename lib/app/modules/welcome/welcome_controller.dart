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
                'O agachamento é um exercício que irá ajudar a ficar com glúteos mais firmes e definidos, mas também pode trazer outros benefícios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
            execusao:
                'Fique de pé com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para trás como se estivesse sentando em uma cadeira. Volte à posição inicial, ficando de pé e repita o movimento 12 vezes de três a quatro séries.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'abdmen',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'Esse é outro exercício que ajuda a definir as coxas e os glúteos, mas um pouco mais intenso que o agachamento. Ele é perfeito para quem busca definir a parte inferior do corpo e praticantes de esportes como corrida, futebol e basquete, pois ajuda a fortalecer as penas e prevenir lesões.',
            execusao:
                'Fique de pé e dê um passo à frente somente com uma das pernas de forma que, ao flexionar os joelhos, a perna de trás forme um ângulo de 90º. Flexione o joelho da perna a frente e desça até o joelho da perna de trás quase tocar o chão. Volte à posição inicial sem estender completamente a posição do corpo para não tirar a tensão dos músculos. Repita pelo menos 12 vezes com cada perna em, no mínimo, duas séries.',
          ),
          ExerciciosModel(
            titulo: 'abdmen',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'O polichinelo auxilia no condicionamento físico e cardiovascular, queima calorias e melhora a coordenação motora. É ótimo como aquecimento antes de iniciar exercícios mais pesados',
            execusao:
                'De pé, com os braços ao lado do corpo, efetue um pequeno salto movendo as mãos como se fosse bater palma acima da cabeça ao mesmo tempo que afasta as pernas lateralmente. Volte à posição inicial e repita o movimento em três séries de 15.',
          ),
        ],
      ),
      TypeExercicios(
        tipo: 'Ombro',
        listaExercicios: [
          ExerciciosModel(
            titulo: 'Shoulder Press com Halteres Fixos',
            prevDescricao:
                'A execução do exercício com as palmas das mãos voltadas para dentro fará com que o deltoide anterior trabalhe mais, o que minimiza a atuação do deltoide lateral. Caso execute o shoulder press com a palma das mãos viradas para trás, trabalhará mais o deltoide anterior.',
            execusao:
                '''Sente-se num banco e coloque os halteres de forma com que o seu braço e antebraço formem um ângulo de 90 graus.
                  As palmas das mãos devem estar voltadas para a frente. Levante os halteres até ficar com os braços esticados. Retorne à posição inicial As costas devem estar sempre eretas.
                Músculos trabalhados com mais ênfase:
                Primário: deltoide anterior
                Secundários: deltoide lateral, tríceps, trapézio e peitoral superior.''',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Levantamento Lateral com Halteres Fixos',
            prevDescricao:
                'Quando os halteres são levantados até o nível do ombro, o deltoide lateral executa a maior parte do trabalho.',
            execusao: '''
                De pé, segure os halteres com os braços estendidos, um de cada lado. Eleve os braços para fora até que os halteres atinjam o nível dos ombros. Regresse lentamente à posição inicial.
                Músculos trabalhados com mais ênfase:
                Primário: deltoide lateral
                Secundários: deltoide anterior, deltoide posterior, trapézio e supra espinal
                 ''',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Polichinelo',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'O polichinelo auxilia no condicionamento físico e cardiovascular, queima calorias e melhora a coordenação motora. É ótimo como aquecimento antes de iniciar exercícios mais pesados',
            execusao:
                'De pé, com os braços ao lado do corpo, efetue um pequeno salto movendo as mãos como se fosse bater palma acima da cabeça ao mesmo tempo que afasta as pernas lateralmente. Volte à posição inicial e repita o movimento em três séries de 15.',
          ),
        ],
      ),
      TypeExercicios(
        tipo: 'Perna',
        listaExercicios: [
          ExerciciosModel(
            titulo: 'Elevação de gêmeos',
            prevDescricao:
                'Com uma mão, agarre um halter e mantenha-o a um lado do corpo. Posicione a ponta dos pés no bloco da máquina com o arco dos pés e os calcanhares do lado de fora. Coloque e apoie a mão livre numa estrutura fixa. Mantenha-se ereto estendendo os quadris e joelho.',
            execusao:
                'A elevação de gêmeos é um exercício que trabalha as panturrilhas. Esse treino consiste em se posicionar sobre um step ou degrau de escada na ponta dos pés e fazer o movimento de descer e subir. Para potencializar a ativação, pode-se usar caneleiras.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Cadeira adutora e abdutora',
            prevDescricao:
                'O treino feito na cadeira adutora serve para ativar os músculos adutores, ou seja, do interior da perna. Essa é uma área que costuma acumular bastante gordura, principalmente nas mulheres e, por isso, o seu fortalecimento, além de deixar o aspecto da coxa mais bonito, também garante maior estabilidade.',
            execusao:
                'Já a execução na cadeira abdutora consiste em trabalhar a parte lateral da coxa, deixando a perna mais torneada e ajudando ao corpo a se manter estável durante outros exercícios.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Agachamento',
            prevDescricao:
                'O agachamento é um exercício que irá ajudar a ficar com glúteos mais firmes e definidos, mas também pode trazer outros benefícios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
            execusao:
                'Fique de pé com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para trás como se estivesse sentando em uma cadeira. Volte à posição inicial, ficando de pé e repita o movimento 12 vezes de três a quatro séries.',
            imagem: 'assets/animation/padrao.json',
          ),
          ExerciciosModel(
            titulo: 'Afundo',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'Esse é outro exercício que ajuda a definir as coxas e os glúteos, mas um pouco mais intenso que o agachamento. Ele é perfeito para quem busca definir a parte inferior do corpo e praticantes de esportes como corrida, futebol e basquete, pois ajuda a fortalecer as penas e prevenir lesões.',
            execusao:
                'Fique de pé e dê um passo à frente somente com uma das pernas de forma que, ao flexionar os joelhos, a perna de trás forme um ângulo de 90º. Flexione o joelho da perna a frente e desça até o joelho da perna de trás quase tocar o chão. Volte à posição inicial sem estender completamente a posição do corpo para não tirar a tensão dos músculos. Repita pelo menos 12 vezes com cada perna em, no mínimo, duas séries.',
          ),
          ExerciciosModel(
            titulo: 'Polichinelo',
            imagem: 'assets/animation/padrao.json',
            prevDescricao:
                'O polichinelo auxilia no condicionamento físico e cardiovascular, queima calorias e melhora a coordenação motora. É ótimo como aquecimento antes de iniciar exercícios mais pesados',
            execusao:
                'De pé, com os braços ao lado do corpo, efetue um pequeno salto movendo as mãos como se fosse bater palma acima da cabeça ao mesmo tempo que afasta as pernas lateralmente. Volte à posição inicial e repita o movimento em três séries de 15.',
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
            'O agachamento é um exercício que irá ajudar a ficar com glúteos mais firmes e definidos, mas também pode trazer outros benefícios como definir barriga, aumentar a massa muscular das coxas e reduzir celulites.',
        execusao:
            'Fique de pé com as pernas afastadas na largura dos ombros. Com as costas sempre eretas, flexione o joelho com o bumbum para trás como se estivesse sentando em uma cadeira. Volte à posição inicial, ficando de pé e repita o movimento 12 vezes de três a quatro séries.',
        imagem: 'assets/animation/padrao.json',
      ),
      ExerciciosModel(
        titulo: 'Afundo',
        imagem: 'assets/animation/padrao.json',
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
        imagem: 'assets/animation/padrao.json',
        prevDescricao:
            'O polichinelo auxilia no condicionamento físico e cardiovascular, queima calorias e melhora a coordenação motora. É ótimo como aquecimento antes de iniciar exercícios mais pesados',
        execusao:
            'De pé, com os braços ao lado do corpo, efetue um pequeno salto movendo as mãos como se fosse bater palma acima da cabeça ao mesmo tempo que afasta as pernas lateralmente. Volte à posição inicial e repita o movimento em três séries de 15.',
      ),
      ExerciciosModel(
        titulo: 'Marcha estacionária',
        imagem: 'assets/animation/padrao.json',
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
    selectedValue!.value = box.read('key') ?? 0;
    valor!.value = box.read('box') ?? false;
    super.onReady();
  }
}
