import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: CustomPaint(
        size: Size(100, 20),
        painter: RoundedRectangleWithTrianglePainter(color: color),
        child: Padding(
          padding: const EdgeInsets.only(left:9.0),
          child: Text(
            text,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedRectangleWithTrianglePainter extends CustomPainter {
  final Color color;

  RoundedRectangleWithTrianglePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final radius = 8.0; // Raio para bordas arredondadas

    final path = Path()
      ..moveTo(radius, 0) // Começa no topo esquerdo com borda arredondada
      ..arcToPoint(Offset(0, radius),
          radius: Radius.circular(radius),
          clockwise: false) // Canto superior esquerdo
      ..lineTo(
          0,
          size.height -
              radius) // Linha para o canto inferior esquerdo antes da borda
      ..arcToPoint(Offset(radius, size.height),
          radius: Radius.circular(radius),
          clockwise: false) // Canto inferior esquerdo
      ..lineTo(size.width * 0.75,
          size.height) // Linha para o canto inferior direito antes do triângulo
      ..lineTo(size.width, size.height / 2) // Linha para a ponta do triângulo
      ..lineTo(size.width * 0.75,
          0) // Linha para o canto superior direito antes do triângulo
      ..close(); // Fecha o caminho

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
