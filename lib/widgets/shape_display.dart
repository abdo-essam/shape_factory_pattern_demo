import 'package:flutter/material.dart';
import '../models/shape.dart';

class ShapeDisplay extends StatelessWidget {
  final Shape? shape;
  final String? error;

  const ShapeDisplay({
    super.key,
    this.shape,
    this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (error != null)
              _buildError(error!)
            else if (shape != null)
              _buildShapeContent(shape!)
            else
              _buildEmptyState(),
          ],
        ),
      ),
    );
  }

  Widget _buildShapeContent(Shape shape) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 200,
          child: Center(
            child: shape.buildShapeWidget(),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          shape.revealMe(),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: shape.color,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildError(String errorMessage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error_outline,
          color: Colors.red,
          size: 48,
        ),
        const SizedBox(height: 16),
        Text(
          errorMessage,
          style: const TextStyle(
            color: Colors.red,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildEmptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Icon(
          Icons.touch_app,
          size: 48,
          color: Colors.grey,
        ),
        SizedBox(height: 16),
        Text(
          'Select a shape to display',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}