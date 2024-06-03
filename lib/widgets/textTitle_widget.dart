import 'package:flutter/material.dart';

class Text_title1_widget extends StatelessWidget {
  final String name;

  const Text_title1_widget({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      '~  \$${name}',
      style: TextStyle(color: Colors.white, fontSize: 25),
    );
  }
}
