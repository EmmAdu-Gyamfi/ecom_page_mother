import 'package:flutter/material.dart';

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
      padding: const EdgeInsets.all(20.0), // Use the correct Types value here
      child: Container(
        height: 60.0, // Use the correct Types value here
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue, // Use the correct Types value here
          borderRadius: BorderRadius.circular(10.0), // Use the correct Types value here
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white, // Use the correct Types value here
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
