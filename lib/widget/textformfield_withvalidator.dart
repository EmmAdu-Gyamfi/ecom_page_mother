import 'package:flutter/material.dart';

class CustomValidatedTextFormField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String validatorErrorMessage;

  const CustomValidatedTextFormField({
    Key? key,
    required this.labelText,
    required this.controller,
    required this.validatorErrorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validatorErrorMessage;
        }
        return null;
      },
    );
  }
}
