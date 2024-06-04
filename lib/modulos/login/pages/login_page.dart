import 'package:autoscript/core/widgets/buttonArrow.dart';
import 'package:autoscript/core/widgets/textTitle_widget.dart';
import 'package:autoscript/core/widgets/textTitle2_widget.dart';
import 'package:autoscript/core/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class Login_page extends StatefulWidget {
  Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  TextEditingController _userController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A2834),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xFF193549),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Color(0xFF000000))),
            width: (MediaQuery.of(context).size.width / 100) * 23.75,
            height: (MediaQuery.of(context).size.height / 100) * 34.96,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                //  mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        'lib/assets/img/logo_robo.png',
                        fit: BoxFit.contain,
                        width: (MediaQuery.of(context).size.width / 100) * 3.06,
                        height:
                            (MediaQuery.of(context).size.width / 100) * 2.34,
                      ),
                      Text_title2_widget(
                          name: "ROUTAINER", cor: Color(0xFFFFC600)),
                      SizedBox(),
                    ],
                  ),
                  Divider(
                    color: Color(0xFFFFC600),
                  ),
                  Text_title1_widget(name: 'Login'),
                  SizedBox(
                    height: 8,
                  ),
                  Text_title2_widget(name: 'Usuario', cor: Color(0xFFFFC600)),
                  Textfield_widget(
                    controller: _userController,
                  ),
                  Text_title2_widget(name: 'Senha', cor: Color(0xFFFFC600)),
                  SizedBox(
                    height: 8,
                  ),
                  Textfield_widget(
                    controller: _passwordController,
                  ),
                  CustomButton(
                      text: 'Entrar', color: Colors.green, onPressed: () {})
                ],
              ),
            )),
      ),
    );
  }
}
