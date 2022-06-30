import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  ThemeData lightTheme = ThemeData(
    primaryColor: Color(0xFFFF0000),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.roboto(
        color: Color(0xFF999999),
      ),
      bodyText2: GoogleFonts.openSans(
        color: Color(0xFF999999),
      ),
      subtitle2: GoogleFonts.openSans(
        color: Color(0xFF999999),
      ),
    ),
  );
}
