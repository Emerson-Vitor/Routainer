import 'package:autoscript/modulos/home/widgets/containerComandoUnico.dart';
import 'package:autoscript/modulos/home/widgets/containerCriate.dart';
import 'package:autoscript/modulos/home/widgets/containerMenu.dart';
import 'package:flutter/material.dart';

class Box_Controller {
  Widget controllContainer({required int valor}) {
    switch (valor) {
      case 1:
        return menu_widget();
      case 2:
        return CriateContainerWidget();
      case 3:
        return comandoUnico_widget();
      default:
        return menu_widget();
    }
  }
}
