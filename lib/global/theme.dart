import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page/global/typedef.dart';

const double letterSpacing = 0;
const int colorShade = 800;
class TextStyles {
  static final TextStyle textInputStyle = GoogleFonts.plusJakartaSans(
    color: const Color(0xFF57636C),
    fontSize: Types.double15,
    letterSpacing: letterSpacing,
    fontWeight: FontWeight.w500,
  );
}

class AppTheme {
  static Color primary = Colors.teal;
  static Color secondary = Colors.grey[colorShade]!;
  static Color buttonTextColor = Colors.white;
  static Color textFieldBorderSide = Colors.white;
}
