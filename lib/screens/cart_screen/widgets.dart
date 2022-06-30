import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/screens/order_screen/payment.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class IssueCard extends StatelessWidget {
  final double width;
  final double height;

  const IssueCard({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return myContainer(
      width: width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.warning_amber_rounded,
                    color: Color(
                      0xffa1a1a1,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  AutoSizeText(
                    "Do you have more issues?",
                    maxFontSize: 22,
                    minFontSize: 10,
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontWeight: FontWeight.w900),
                  ),
                ],
              ),
              AutoSizeText(
                "Select",
                maxFontSize: 22,
                minFontSize: 10,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w900,
                    color: Theme.of(context).primaryColor),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: width * 0.8,
            child: AutoSizeText(
                "Please mention any symptoms(issues) you have noticed in your car. This will help our technician to diagnose better.",
                maxFontSize: 22,
                minFontSize: 10,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w300)),
          ),
        ],
      ),
    );
  }
}

class ServiceAddBox extends StatelessWidget {
  final double width;
  final double height;

  const ServiceAddBox({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return myContainer(
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Color(0xffa1a1a1),
                child: Text(
                  "1",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "1 Service Added",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          AutoSizeText(
            "Add more",
            maxFontSize: 22,
            minFontSize: 10,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w900,
                color: Theme.of(context).primaryColor),
          ),
        ],
      ),
    );
  }
}

Widget myContainer({
  required Widget? child,
  required double width,
  Color? borderColor,
  EdgeInsetsGeometry? customPadding,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    width: width * 0.95,
    decoration: BoxDecoration(
      border:
          Border.all(color: borderColor ?? Color(0xff999999).withOpacity(0.2)),
      borderRadius: BorderRadius.circular(5),
    ),
    padding: customPadding ?? EdgeInsets.all(10),
    child: child,
  );
}

Widget ContinueBtn({required Function() onpres}) {
  return ListTile(
    tileColor: Color(0xffa1a1a1),
    trailing: GestureDetector(
      onTap: onpres,
      child: Container(
        decoration: BoxDecoration(
            color: Consts().primaryColor,
            borderRadius: BorderRadius.circular(5)),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: AutoSizeText(
          "Continue",
          minFontSize: 12,
          maxFontSize: 18,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    ),
    title: Row(
      children: [
        CircleAvatar(
          radius: 15,
          backgroundColor: Colors.white,
          child: Text(
            "1",
            style: TextStyle(
                color: Color(0xffa1a1a1), fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AutoSizeText(
              "Rs 1500",
              minFontSize: 14,
              maxFontSize: 22,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            AutoSizeText(
              "View detailed Bill",
              minFontSize: 10,
              maxFontSize: 22,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 12,
                decoration: TextDecoration.underline,
              ),
            )
          ],
        )
      ],
    ),
  );
}
