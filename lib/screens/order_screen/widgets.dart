import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CallUsButton extends StatelessWidget {
  final double width;
  final double height;

  const CallUsButton({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 60,
      decoration: BoxDecoration(
        color: Consts().primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      alignment: Alignment.center,
      child: AutoSizeText(
        "Call Us",
        minFontSize: 16,
        maxFontSize: 22,
        style: GoogleFonts.openSans(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
