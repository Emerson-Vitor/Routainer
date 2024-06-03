import 'package:autoscript/widgets/buttonArrow.dart';
import 'package:autoscript/widgets/button_status.dart';
import 'package:autoscript/widgets/textTitle2_widget.dart';
import 'package:autoscript/widgets/textTitle_widget.dart';
import 'package:autoscript/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class CriateContainerWidget extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _sOController = TextEditingController();
  final TextEditingController _timeTaskController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _commandController = TextEditingController();

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: ListTile(
                leading: Image.asset(
                  'assets/img/logo_robo.png',
                  width: 50,
                  height: 50,
                ),
                title: Center(child: Text_title1_widget(name: 'Criar_Rotina')),
                trailing: Container(
                  width:
                      80, // Define a width to ensure it gets laid out properly
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ButtonStatus_widget(
                        cor: Colors.green,
                        agir: () {},
                        size: 16,
                        hoverColor: const Color.fromARGB(255, 46, 119, 49),
                      ),
                      ButtonStatus_widget(
                        cor: Colors.red,
                        agir: () {},
                        size: 16,
                        hoverColor: const Color.fromARGB(255, 97, 29, 24),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xFFFFC600),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(children: [
                        Container(
                          padding: EdgeInsets.only(left: 25),
                            height: 22,
                            width: 100,
                            child: CustomButton(
                                text: '12',
                                color: Color(0xFFFFC600),
                                onPressed: () {})),
                        Container(
                            height: 22,
                            width: 50,
                            child: CustomButton(
                                text: 'ID',
                                color: Colors.red,
                                onPressed: () {})),
                      ]),
                      SizedBox(
                        height: 8,
                      ),
                      Text_title2_widget(
                          name: 'Titulo', cor: Color(0xFFFFC600)),
                      Textfield_widget(controller: _titleController),
                      SizedBox(height: 8),
                      Text_title2_widget(
                          name: 'Sistema Operacinal', cor: Color(0xFFFFC600)),
                      Textfield_widget(controller: _sOController),
                      SizedBox(height: 8),
                      Text_title2_widget(
                          name: 'Timetask', cor: Color(0xFFFFC600)),
                      Textfield_widget(controller: _timeTaskController),
                      SizedBox(height: 8),
                      Text_title2_widget(
                          name: 'Status', cor: Color(0xFFFFC600)),
                      Textfield_widget(controller: _statusController),
                      SizedBox(height: 8),
                      Text_title2_widget(
                          name: 'Descrição', cor: Color(0xFFFFC600)),
                      Textfield_widget(controller: _descriptionController),
                      SizedBox(height: 8),
                      Text_title2_widget(
                          name: 'Comando', cor: Color(0xFFFFC600)),
                      Textfield_widget(controller: _commandController),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
