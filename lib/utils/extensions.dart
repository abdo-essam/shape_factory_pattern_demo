import 'package:flutter/material.dart';

extension StringExtensions on String {
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}

extension ColorExtensions on Color {
  Color get lighten => withOpacity(0.2);

  MaterialStateProperty<Color?> get materialState =>
      MaterialStateProperty.all<Color>(this);
}

extension BuildContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  Size get screenSize => MediaQuery.of(this).size;

  void showSnackBar(String message) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}

extension WidgetExtensions on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(
      padding: padding,
      child: this,
    );
  }

  Widget centered() {
    return Center(child: this);
  }

  Widget card({
    double? elevation,
    Color? color,
    BorderRadius? borderRadius,
  }) {
    return Card(
      elevation: elevation,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(16),
      ),
      child: this,
    );
  }
}