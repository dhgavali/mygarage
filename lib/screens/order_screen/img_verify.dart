import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/order_screen/order_confirm.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';

import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ImgVerification extends StatefulWidget {
  @override
  State<ImgVerification> createState() => ImgVerificationState();
}

class ImgVerificationState extends State<ImgVerification> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: ContinueBtn(onpres: () {
          pushNewScreen(context,
              screen: OrderConfirm(),
              pageTransitionAnimation: PageTransitionAnimation.cupertino);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(height: height, width: width),
              AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Image Verification",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
                leading: MyBackButton(),
              ),
              Divider(height: height * 0.01, color: Colors.transparent),
              Container(
                width: width,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: AutoSizeText(
                  "Please upload images of 4 sides of your vehicle, in order to avoid any misconvience. These images will be verified by garage person when you enter your vehcile at garage.",
                  minFontSize: 12,
                  maxFontSize: 18,
                  textAlign: TextAlign.justify,
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(height: height * 0.05, color: Colors.transparent),
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Consts.titleText(text: "Add Photos"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _addImgBox(width),
                      _addImgBox(width),
                      _addImgBox(width),
                      _addImgBox(width),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _addImgBox(double width) {
    return Container(
      width: width * 0.18,
      height: width * 0.18,
      decoration: BoxDecoration(
        border: Border.all(color: Consts().greyColor.withOpacity(.2)),
      ),
      child: Icon(
        Icons.add,
        color: Consts().greyColor.withOpacity(
              0.8,
            ),
      ),
    );
  }
}
