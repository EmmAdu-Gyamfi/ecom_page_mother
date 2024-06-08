import 'package:flutter/material.dart';
import 'package:page/global/theme.dart';
import '../global/typedef.dart';

class textFormField extends StatefulWidget {
  final hintText;
  final textInputType;
  final bool activatePasswordField;

  const textFormField({
    Key? key,
    required this.hintText,
    this.textInputType,
    this.activatePasswordField = false
  }) : super(key: key);

  @override
  State<textFormField> createState() => _textFormFieldState();
}

class _textFormFieldState extends State<textFormField> {
  bool _obscureText = true;
  @override
  void initState() {
    super.initState();
    _obscureText = widget.activatePasswordField;
  }

  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      //autofillHints: [AutofillHints.email],
      obscureText: widget.activatePasswordField ? _obscureText : false,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: TextStyles.textH6,
        suffixIcon: widget.activatePasswordField
            ? GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(
            _obscureText ? Icons.visibility_off : Icons.visibility,
          ),
        )
            : null,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.textFieldBorderSide,

          ),
          borderRadius: Types.radiusBorderMedium
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme.primary,

          ),
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

      style: TextStyles.textH6,
      keyboardType: widget.textInputType,
    );
  }
}
