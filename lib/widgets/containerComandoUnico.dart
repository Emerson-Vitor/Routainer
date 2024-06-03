import 'package:autoscript/widgets/textTitle2_widget.dart';
import 'package:flutter/material.dart';

class comandoUnico_widget extends StatelessWidget {
  const comandoUnico_widget({super.key});

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
               padding: const EdgeInsets.only (top: 8.0, bottom: 8.0),
             
              child: ListTile(
                leading: Image.asset(
                  'assets/img/logo_robo.png',
                  width: 50,
                  height: 50,
                ),
                title: Center(
                    child:
                        Text_title2_widget(name: 'ROUTAINER', cor: Colors.white)),
                trailing: GestureDetector(
                  onTap: () {},
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('>_Sync',
                          style: TextStyle(color: Colors.green, fontSize: 10)),
                      Text('Ultima sincronização:',
                          style: TextStyle(color: Colors.green, fontSize: 10)),
                      Text('yyyy-MM-dd HH:mm',
                          style: TextStyle(color: Colors.green, fontSize: 10))
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: Color(0xFFFFC600),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                leading:
                    Image.asset('assets/img/criar.png', width: 50, height: 50),
                title: Text("/Criar_Rotina",
                    style: TextStyle(color: Color(0xFFFFC600))),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: ListTile(
                leading: Image.asset('assets/img/comando.png',
                    width: 50, height: 50),
                title: Text("/Comando_unico",
                    style: TextStyle(color: Color(0xFFFFC600))),
              ),
            )
          ],
        ),
      ),
    );
  }
}    