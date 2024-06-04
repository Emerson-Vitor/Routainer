import 'package:autoscript/core/models/script_model.dart';
import 'package:autoscript/modulos/home/widgets/button_status.dart';
import 'package:autoscript/core/widgets/textTitle2_widget.dart';
import 'package:autoscript/core/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class CardScript_widget extends StatelessWidget {
  final Script script;

  CardScript_widget({required this.script, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,  // Adicionado para garantir largura máxima
        constraints: BoxConstraints(
          minHeight: 200,  // Altura mínima para evitar problemas de layout
        ),
        decoration: BoxDecoration(
          color: Color(0xFF193549),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF000000)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(2.0, 2.0),
              spreadRadius: 1.0,
              blurRadius: 7.5,
            )
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text_title2_widget(
                        name: script.id,
                        cor: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text_title2_widget(
                        name: script.name,
                        cor: Colors.white,
                      ),
                    ],
                  ),
                  ButtonStatus_widget(cor: Colors.green, agir: () {},size: 32,hoverColor: Colors.green ,),
                ],
              ),
            ),
            Divider(color: Color(0xFFFFC600)),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text_widget(name: 'Descrição: '),
                      Text_widget(name: script.description),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text_widget(name: 'Sistema Operacional: '),
                          Text_widget(name: script.operationalSystem),
                        ],
                      ),
                      Row(
                        children: [
                          Text_widget(name: 'Timetask: '),
                          Text_widget(name: script.timetask.toString()),
                        ],
                      ),
                      Row(
                        children: [
                          Text_widget(name: 'Comandos: '),
                          Text_widget(name: script.commands.toString()),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit, size: 35),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
