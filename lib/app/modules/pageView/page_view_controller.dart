import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewController extends GetxController {
  RxInt paginaAtual = 0.obs;

  late PageController pc;

  var isSeleted = false.obs;

  void switchPageBar(int pagina) {
    pc.animateToPage(
      pagina,
      duration: Duration(milliseconds: 350),
      curve: Curves.easeIn,
    );
  }

  void setPaginaAtual(pagina) {
    paginaAtual.value = pagina;
  }

  @override
  void onInit() {
    pc = PageController(initialPage: paginaAtual.value);
    super.onInit();
  }
}
