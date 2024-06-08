import 'package:flutter/material.dart';
import 'package:page/global/theme.dart';
import '../global/typedef.dart';


class TextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const TextButton({
    super.key,
    required this.text,
    required this.onPressed, required Text child,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      text: '',
      child: Text(
        text,
        style: TextStyle(
          fontSize: Types.navTextSmall,
          color: AppTheme.primary,
        ),
      ),
    );
  }
}