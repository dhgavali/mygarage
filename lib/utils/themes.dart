import 'package:bee/utils/colours.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
      bodyText1: GoogleFonts.roboto(
        fontSize: 18,
        color: Colours().kTextColor,
      ),
      bodyText2: GoogleFonts.openSans(
        fontSize: 18,
        color: Colours().kTextColor,
      ),
    ),
  );
}
