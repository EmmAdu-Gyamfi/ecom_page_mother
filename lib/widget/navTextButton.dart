import 'package:flutter/material.dart';
import 'package:page/global/theme.dart';
import '../global/typedef.dart';


class NavTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  NavTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
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