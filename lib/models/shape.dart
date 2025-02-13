import 'package:flutter/material.dart';

abstract class Shape {
  String revealMe();
  Color get color;
  IconData get icon;
  String get name;
  Widget buildShapeWidget();
}