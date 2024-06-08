import 'package:flutter/material.dart';
import '../global/theme.dart';
import '../global/typedef.dart';

class ButtonMenu extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsets padding;

  ButtonMenu({
    required this.icon,
    required this.text,
    required this.onPressed,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(horizontal: Types.paddingLarge, vertical: Types.paddingMedium),
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: AppTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: AppTheme.buttonTextColor),
      ),
    );
  }
}
