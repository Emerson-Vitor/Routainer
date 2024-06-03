import 'package:flutter/material.dart';

class Text_title2_widget extends StatelessWidget {
  final String name;
  final Color cor;

  const Text_title2_widget({required this.name, required this.cor, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: TextStyle(
        color: cor,
        fontSize: 18,
      ),
    );
  }
}
