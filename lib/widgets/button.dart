import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;

  CustomTextButton({
    required this.label,
    required this.focusNode,
    required this.nextFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      onKey: (FocusNode node, RawKeyEvent event) {
        if (event is RawKeyDownEvent && event.logicalKey == LogicalKeyboardKey.enter) {
          FocusScope.of(context).requestFocus(nextFocusNode);
          return KeyEventResult.handled;
        }
        return KeyEventResult.ignored;
      },
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        ),
        onPressed: () {
          // Ação do botão
        },
        child: Text(
          label,
          style: TextStyle(color: Color(0xFF51EF61)),
        ),
      ),
    );
  }
}
