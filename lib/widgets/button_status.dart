import 'package:flutter/material.dart';

class ButtonStatus_widget extends StatelessWidget {
  Color cor = Colors.grey;
  Color hoverColor;
  final double size;
  Function agir;
  ButtonStatus_widget({required this.cor, required this.agir,required this.size,required this.hoverColor, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: size,
        width: size,
        child: FloatingActionButton(
          shape: CircleBorder(),
          backgroundColor: cor,
          hoverColor: hoverColor,
          mini: true, // Define o botão como mini
          onPressed: () {
            agir;
          },
          // Ícone opcional para o botão
        ),
      ),
    );
  }
}
