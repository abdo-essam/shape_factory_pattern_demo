import 'package:flutter/material.dart';
import '../utils/constants.dart';

class ShapeButton extends StatelessWidget {
  final VoidCallback? onPressed; // Make it nullable
  final IconData icon;
  final String label;
  final Color color;

  const ShapeButton({
    super.key,
    required this.onPressed,
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, // ElevatedButton accepts nullable callback
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        disabledBackgroundColor: color.withOpacity(0.6),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.defaultPadding,
          vertical: AppConstants.defaultPadding / 2,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white,),
          const SizedBox(width: AppConstants.iconSpacing),
          Text(label),
        ],
      ),
    );
  }
}
