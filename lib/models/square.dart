import 'package:flutter/material.dart';
import 'shape.dart';

class Square implements Shape {
  @override
  String revealMe() => "You chose to print square";

  @override
  Color get color => Colors.purple;

  @override
  IconData get icon => Icons.square_outlined;

  @override
  String get name => 'Square';

  @override
  Widget buildShapeWidget() {
    return CustomPaint(
      size: const Size(100, 100),
      painter: SquarePainter(color: color),
    );
  }
}

class SquarePainter extends CustomPainter {
  final Color color;

  SquarePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    canvas.drawRect(rect, paint);
    canvas.drawRect(rect, borderPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}