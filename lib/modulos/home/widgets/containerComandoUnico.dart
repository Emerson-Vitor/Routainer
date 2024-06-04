import 'package:autoscript/core/widgets/buttonArrow.dart';
import 'package:autoscript/modulos/home/widgets/button_status.dart';
import 'package:autoscript/core/widgets/textTitle2_widget.dart';
import 'package:autoscript/core/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

class comandoUnico_widget extends StatelessWidget {
  comandoUnico_widget({super.key});

  TextEditingController _sOController = TextEditingController();
  TextEditingController _comadsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.only(top: 8),
        width: MediaQuery.of(context).size.width / 100 * 25,
        height: MediaQuery.of(context).size.height / 100 * 90,
        decoration: BoxDecoration(
          color: Color(0xFF193549),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF000000)),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(2.0, 2.0),
                spreadRadius: 1.0,
                blurRadius: 7.5)
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                leading: Image.asset(
                  'assets/img/logo_robo.png',
                  width: 50,
                  height: 50,
                ),
                title: Center(
                    child: Text_title2_widget(
                        name: 'ROUTAINER', cor: Colors.white)),
                trailing: Container(
                  height: 22,
                  width: 50,
                  child: ButtonStatus_widget(
                    cor: Colors.red,
                    agir: () {},
                    size: 16,
                    hoverColor: const Color.fromARGB(255, 97, 29, 24),
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xFFFFC600),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(height: 8),
                          Text_title2_widget(
                              name: 'Sistema Operacinal',
                              cor: Color(0xFFFFC600)),
                          Textfield_widget(controller: _sOController),
                          SizedBox(height: 8),
                          Text_title2_widget(
                              name: 'Comandos', cor: Color(0xFFFFC600)),
                          Textfield_widget(controller: _comadsController),
                          SizedBox(height: 32),
                          SizedBox(
                              height: 22,
                              width: 100,
                              child: CustomButton(
                                  text: 'Executar',
                                  color: Colors.green,
                                  onPressed: () {})),
                          SizedBox(height: 8),
                          Center(
                            child: InnerShadow(
                              shadows: [
                                Shadow(
                                    color: Colors.black.withOpacity(0.50),
                                    blurRadius: 10,
                                    offset: Offset(-3, -3))
                              ],
                              child: Container(
                                margin: EdgeInsets.all(2),
                                width: MediaQuery.of(context).size.width /
                                    100 *
                                    25,
                                height: MediaQuery.of(context).size.height /
                                    100 *
                                    50,
                                decoration: BoxDecoration(
                                  color: Color(0xFF1A2834),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xFF000000)),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
