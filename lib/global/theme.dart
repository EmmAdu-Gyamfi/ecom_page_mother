import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static final TextStyle textH6 = GoogleFonts.plusJakartaSans(
    color: Color(0xFF57636C),
    fontSize: 14,
    letterSpacing: 0,
    fontWeight: FontWeight.w500,
  );
}

class AppTheme {
  static Color primary = Colors.teal;
  static Color secondary = Colors.grey[800]!;
  static Color buttonTextColor = Colors.white;
}
