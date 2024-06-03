import 'package:autoscript/widgets/textTitle2_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Textfield_widget extends StatelessWidget {
  TextEditingController controller;

  Textfield_widget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        border: InputBorder.none,
        icon: Icon(
          Icons.keyboard_arrow_right,
          color: Color(0xFFFFC600),size: 20,
        ),
      ),
      onSubmitted: (value) {
        FocusScope.of(context).nextFocus();
      },
    );
  }
}
