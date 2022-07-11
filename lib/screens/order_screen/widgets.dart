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

class StatusInfo extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isSubtitle;
  final Color subtitleColor;

  const StatusInfo({
    required this.title,
    required this.subtitle,
    this.isSubtitle = false,
    this.subtitleColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Consts.titleText(text: title),
          SizedBox(
            height: 5,
          ),
          isSubtitle
              ? Container(
                  child: Consts.titleText3(
                      text: subtitle, minfsize: 10, color: subtitleColor),
                )
              : Container(),
        ],
      ),
    );
  }
}
