import 'package:flutter/material.dart';
import 'package:page/global/typedef.dart';
// add default text size
// add color for button and text
const double buttonWidthDefault = 100;
const double buttonHeightDefault = 50;
const Color buttonColorDefault = Types.colourBlue;
const Color fontColorDefault = Types.colourApp;
const double fontSizeDefault = 15;

class CustomCheckoutButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? color;
  final Color? fontColor;
  final double? width;
  final double? height;
  final double? fontSize;

  const CustomCheckoutButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.icon,
    this.color = buttonColorDefault,
    this.width = buttonWidthDefault,
    this.height = buttonWidthDefault,
    this.fontSize = fontSizeDefault,
    this.fontColor = fontColorDefault
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Types.paddingLarge),
      child: InkWell(
        onTap: () => onPressed,
        child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(Types.paddingMedium),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Padding(
                  padding: const EdgeInsets.all(Types.double5),
                  child: Icon(icon, color: Types.colourApp),
                )
              ],
              Text(
                buttonText,
                style: TextStyle(
                  color: fontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: fontSize,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
