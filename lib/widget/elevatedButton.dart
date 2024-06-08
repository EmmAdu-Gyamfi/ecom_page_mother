import 'package:flutter/material.dart';
import '../global/theme.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double borderRadius;
  final EdgeInsets padding;

  ProfileButton({
    required this.text,
    required this.onPressed,
    this.borderRadius = 30.0,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppTheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: padding,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, color: AppTheme.bottonTextColor),
      ),
    );
  }
}
