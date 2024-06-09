import 'package:flutter/material.dart';
import 'package:page/global/typedef.dart';

class CustomCheckoutButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const CustomCheckoutButton({
    Key? key,
    required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Types.paddingLarge), // Use the correct Types value here
      child: Container(
        height: Types.double60, // Use the correct Types value here
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Types.colourBlue, // Use the correct Types value here
          borderRadius: BorderRadius.circular(Types.paddingMedium), // Use the correct Types value here
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Types.colourApp, // Use the correct Types value here
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
