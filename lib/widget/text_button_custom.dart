import 'package:flutter/material.dart';
import 'package:page/global/theme.dart';
import '../global/typedef.dart';


class TextButtonCustom extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  const TextButtonCustom({super.key, required this.label, required this.onPressed, required Text child});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(label, style: TextStyle(fontSize: Types.fontSizeH4, color: AppTheme.primary)),
    );
  }
}