import 'package:autoscript/core/models/script_model.dart';
import 'package:autoscript/modulos/home/controllers/box_controller.dart';
import 'package:autoscript/modulos/home/widgets/containerComandoUnico.dart';
import 'package:autoscript/modulos/home/widgets/filter.dart';
import 'package:autoscript/modulos/home/widgets/scrollBar.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _MyWidgetState();
}

final ScrollController _scrollController = ScrollController();
Box_Controller box = Box_Controller();
late Widget caixaDeAcao;
late int valor;
Script scriptteste = Script(
    id: '1',
    name: 'teste',
    description: 'description',
    timetask: DateTime.now(),
    commands: ['teste1', 'teste2', 'teste3'],
    status: true,
    operationalSystem: 'W');

class _MyWidgetState extends State<Home_page> {
  @override
  void initState() {
    super.initState();
    valor = 1;  // Initialize the class field here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 100 * 90,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 100 * 70,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FilterWidget(),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: ScrollBarWidgetState(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: caixaDeAcao = box.controllContainer(valor: valor),
              )
            ],
          ),
        ),
      ),
    );
  }
}
