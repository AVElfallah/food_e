import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeHelper {
  TextThemeHelper(this.textTheme);

  final TextTheme? textTheme;

  factory TextThemeHelper.withColor(Color? themeColor) {
    return TextThemeHelper(
      TextTheme(
        headlineLarge: GoogleFonts.bebasNeue(
          color: themeColor,
          fontSize: 36,
        ),
        headlineMedium: GoogleFonts.bebasNeue(
          color: themeColor,
          fontSize: 24,
        ),
        headlineSmall: GoogleFonts.bebasNeue(
          color: themeColor,
          fontSize: 18,
        ),
        labelSmall: GoogleFonts.bebasNeue(
          color: themeColor,
          fontSize: 12,
        ),
        bodyMedium: GoogleFonts.poppins(
          color: themeColor,
          fontSize: 14,
        ),
        bodyLarge: GoogleFonts.poppins(
          color: themeColor,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        labelMedium: GoogleFonts.poppins(
          color: themeColor,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
