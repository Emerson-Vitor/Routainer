import 'package:flutter/material.dart';

class Textfield_widget extends StatelessWidget {
  TextEditingController controller;

  Textfield_widget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: null, // Permite múltiplas linhas
      textAlignVertical: TextAlignVertical.top,
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: Color(0xFFFFC600),
          size: 20,
        ),
      ),
      onSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}
