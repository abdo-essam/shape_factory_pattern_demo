import '../models/circle.dart';
import '../models/rectangle.dart';
import '../models/shape.dart';
import '../models/square.dart';

class ShapeFactory {
  Shape getShape(String shapeType) {
    switch (shapeType.toLowerCase()) {
      case 'circle':
        return Circle();
      case 'rectangle':
        return Rectangle();
      case 'square':
        return Square();
      default:
        throw Exception('Unknown shape type: $shapeType');
    }
  }
}