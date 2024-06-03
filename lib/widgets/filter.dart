import 'package:autoscript/widgets/button_status.dart';
import 'package:autoscript/widgets/textTitle2_widget.dart';
import 'package:autoscript/widgets/textTitle_widget.dart';
import 'package:autoscript/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class FilterWidget extends StatelessWidget {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _sOController = TextEditingController();
  final TextEditingController _timetaskController = TextEditingController();

  FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: EdgeInsets.all(8),
        width: MediaQuery.of(context).size.width / 100 * 70,
        height: MediaQuery.of(context).size.height / 100 * 17,
        decoration: BoxDecoration(
          color: Color(0xFF193549),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Color(0xFF000000)),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: Offset(2.0, 2.0),
                spreadRadius: 1.0,
                blurRadius:7.5)
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [Text_title1_widget(name: 'Filtros')],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_title2_widget(
                              name: 'ID', cor: Color(0xFFFFC600)),
                          Textfield_widget(controller: _idController),
                          SizedBox(width: 8),
                        ]),
                  ), // Espaçamento entre os campos],)
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_title2_widget(
                              name: 'TITULO', cor: Color(0xFFFFC600)),
                          Textfield_widget(controller: _titleController),
                          SizedBox(width: 8),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_title2_widget(
                              name: 'S.O', cor: Color(0xFFFFC600)),
                          Textfield_widget(controller: _sOController),
                          SizedBox(width: 8),
                        ]),
                  ),
                  Expanded(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text_title2_widget(
                              name: 'TIMETASK', cor: Color(0xFFFFC600)),
                          Textfield_widget(controller: _timetaskController),
                          SizedBox(width: 8),
                        ]),
                  ),
                  ButtonStatus_widget(cor: Colors.grey, agir: () {},size: 32,hoverColor: Colors.green,)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
