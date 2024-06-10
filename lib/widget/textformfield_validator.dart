import 'package:flutter/material.dart';
import '../global/theme.dart';
import '../global/typedef.dart';

class TextFormFieldCustom extends StatefulWidget {
  final String? labelText;
  TextEditingController controller;
  final String errorMessage;
  final RegExp validator;
  final bool activatePasswordField;
  final dynamic hintText;

   TextFormFieldCustom({
    super.key,
    this.labelText,
    required this.controller,
    required this.errorMessage,
    required this.hintText,
    required this.validator,
    this.activatePasswordField = false
  });

  @override
  State<TextFormFieldCustom> createState() => _TextFormFieldCustomState();
}

class _TextFormFieldCustomState extends State<TextFormFieldCustom> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.activatePasswordField;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(Types.double10),
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.labelText,
          hintText: widget.hintText,
          hintStyle: TextStyles.textInputStyle,
          suffixIcon: widget.activatePasswordField ? GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(_obscureText ? Icons.visibility_off : Icons.visibility),
          ) : null,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.textFieldBorderSide),
              borderRadius: Types.radiusBorderMedium
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.primary),
              borderRadius: Types.radiusBorderMedium
          ),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.textFieldBorderSide,
                width: Types.borderWidthSmall,
              ),
              borderRadius: Types.radiusBorderMedium
          ),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.textFieldBorderSide,
                width: Types.borderWidthSmall,
              ),
              borderRadius: Types.radiusBorderMedium
          ),
          filled: true,
          fillColor: AppTheme.textFieldBorderSide,
        ),
        style: TextStyles.textInputStyle,
        validator: (value) {
          return textInputCustomValidationFn(
              value!, widget.validator, widget.errorMessage);
        },
      ),
    );
  }

  // custom text input validation with error message
  static String? textInputCustomValidationFn(String value, RegExp customRegExp,
      String errorMessage) {
    if (!customRegExp.hasMatch(value)) {
      return errorMessage;
    } else {
      return value.isEmpty ? 'Field is required' : null;
    }
  }
}
