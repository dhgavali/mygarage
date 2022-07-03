import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Consts {
  final Color border_color = Color(0xff999999);
  final Color greyColor = Color(0xffa1a1a1);

  //colors
  static final Color kprimary = Color(0xffff0000);
  //fontsizes
  static final double stitle1 = 14;
  static final double stitle2 = 12;
  static final double stitle3 = 10;
  static final double stitle4 = 8;

  static TextStyle greyFont(double fontsize) {
    return GoogleFonts.openSans(
      color: Consts().greyColor,
      fontSize: fontsize,
    );
  }

  static TextStyle greyBold(double fontsize) {
    return GoogleFonts.openSans(
      color: Consts().greyColor,
      fontSize: fontsize,
      fontWeight: FontWeight.w700,
    );
  }

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
      minFontSize: 12,
      maxFontSize: 22,
      style: GoogleFonts.openSans(
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static Widget titleText3({
    required String text,
    Color color = const Color(0xff999999),
    double minfsize = 14,
  }) {
    return AutoSizeText(
      text,
      minFontSize: minfsize,
      maxFontSize: 22,
      style: GoogleFonts.openSans(
        color: color,
        fontSize: minfsize,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}




  List<DropdownMenuItem<String>> get stateNameItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Andhra Pradesh"), value: "Andhra Pradesh"),
      DropdownMenuItem(
          child: Text("Arunachal Pradesh"), value: "Arunachal Pradesh"),
      DropdownMenuItem(child: Text("Assam"), value: "Assam"),
      DropdownMenuItem(child: Text("Bihar"), value: "Bihar"),
      DropdownMenuItem(child: Text("Chhattisgarh"), value: "Chhattisgarh"),
      DropdownMenuItem(child: Text("Goa"), value: "Goa"),
      DropdownMenuItem(child: Text("Gujarat"), value: "Gujarat"),
      DropdownMenuItem(child: Text("Haryana"), value: "Haryana"),
      DropdownMenuItem(
          child: Text("Himachal Pradesh"), value: "Himachal Pradesh"),
      DropdownMenuItem(
          child: Text("Jammu and Kashmir"), value: "Jammu and Kashmir"),
      DropdownMenuItem(child: Text("Jharkhand"), value: "Jharkhand"),
      DropdownMenuItem(child: Text("Karnataka"), value: "Karnataka"),
      DropdownMenuItem(child: Text("Kerala"), value: "Kerala"),
      DropdownMenuItem(child: Text("Madhya Pradesh"), value: "Madhya Pradesh"),
      DropdownMenuItem(child: Text("Maharashtra"), value: "Maharashtra"),
      DropdownMenuItem(child: Text("Manipur"), value: "Manipur"),
      DropdownMenuItem(child: Text("Meghalaya"), value: "Meghalaya"),
      DropdownMenuItem(child: Text("Mizoram"), value: "Mizoram"),
      DropdownMenuItem(child: Text("Nagaland"), value: "Nagaland"),
      DropdownMenuItem(child: Text("Odisha"), value: "Odisha"),
      DropdownMenuItem(child: Text("Punjab"), value: "Punjab"),
      DropdownMenuItem(child: Text("Rajasthan"), value: "Rajasthan"),
      DropdownMenuItem(child: Text("Sikkim"), value: "Sikkim"),
      DropdownMenuItem(child: Text("Tamil Nadu"), value: "Tamil Nadu"),
      DropdownMenuItem(child: Text("Telangana"), value: "Telangana"),
      DropdownMenuItem(child: Text("Tripura"), value: "Tripura"),
      DropdownMenuItem(child: Text("Uttarakhand"), value: "Uttarakhand"),
      DropdownMenuItem(child: Text("Uttar Pradesh"), value: "Uttar Pradesh"),
      DropdownMenuItem(child: Text("West Bengal"), value: "West Bengal"),
      DropdownMenuItem(
          child: Text("Andaman and Nicobar Islands"),
          value: "Andaman and Nicobar Islands"),
      DropdownMenuItem(child: Text("Chandigarh"), value: "Chandigarh"),
      DropdownMenuItem(
          child: Text("Dadra and Nagar Haveli"),
          value: "Dadra and Nagar Haveli"),
      DropdownMenuItem(child: Text("Daman and Diu"), value: "Daman and Diu"),
      DropdownMenuItem(child: Text("Delhi"), value: "Delhi"),
      DropdownMenuItem(child: Text("Lakshadweep"), value: "Lakshadweep"),
      DropdownMenuItem(child: Text("Puducherry"), value: "Puducherry"),
    ];
    return menuItems;
  }
