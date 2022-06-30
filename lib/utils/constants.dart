import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  final Color border_color = Color(0xff999999);
  final Color greyColor = Color(0xffa1a1a1);

  // TextStyles

  TextStyle redText = GoogleFonts.openSans(
    color: Colors.red,
    fontWeight: FontWeight.w600,
  );

  final Color primaryColor = Colors.red;

  static Widget titleText(
      {required String text, Color color = const Color(0xff999999)}) {
    return AutoSizeText(
      text,
      minFontSize: 16,
      maxFontSize: 22,
      style: GoogleFonts.openSans(
        color: color,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static Widget titleText2(
      {required String text, Color color = const Color(0xff999999)}) {
    return AutoSizeText(
      text,
      minFontSize: 14,
      maxFontSize: 22,
      style: GoogleFonts.openSans(
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
