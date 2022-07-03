import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/order_screen/add_card.dart';
import 'package:bee/screens/order_screen/img_verify.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';

import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => PaymentPageState();
}

class PaymentPageState extends State<PaymentPage> {
  String service = "";
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        floatingActionButton: ContinueBtn(onpres: () {
          pushNewScreen(context,
              screen: service == "card" ? AddDebitCard() : ImgVerification(),
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
                  "Payment",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
                leading: MyBackButton(),
              ),
              Divider(height: height * 0.005, color: Colors.transparent),
              myContainer(
                customPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                customMargin: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                      child: Consts.titleText3(
                          minfsize: Consts.stitle1, text: "UPI Payment"),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _paytm(),
                        _gpay(),
                        _paytm(),
                        _gpay(),
                      ],
                    ),
                  ],
                ),
              ),
              myContainer(
                customPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                customMargin: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                      child: Consts.titleText3(
                          minfsize: Consts.stitle1, text: "Pay After Service"),
                    ),
                    RadioListTile(
                        value: "pay at garage",
                        groupValue: service,
                        activeColor: Consts().primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Row(children: [
                          Icon(
                            Icons.credit_card,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Consts.titleText3(
                            text: "Pay at garage",
                          ),
                        ]),
                        onChanged: (value) {
                          setState(() {
                            service = "pay at garage";
                          });
                        })
                  ],
                ),
              ),
              myContainer(
                width: width,
                customPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                customMargin: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                      child: Consts.titleText3(
                          minfsize: Consts.stitle1, text: "Pay After Service"),
                    ),
                    RadioListTile(
                        value: "card",
                        groupValue: service,
                        activeColor: Consts().primaryColor,
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Row(children: [
                          Icon(
                            Icons.credit_card,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Consts.titleText3(
                            text: "Visa / Master card",
                          ),
                        ]),
                        onChanged: (value) {
                          setState(() {
                            service = "card";
                          });
                        })
                  ],
                ),
              ),
              myContainer(
                width: width,
                customPadding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, bottom: 10),
                      child: Consts.titleText3(
                          minfsize: Consts.stitle1, text: "Wallet"),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        _paytm(),
                        _gpay(),
                        _paytm(),
                        _gpay(),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _paytm() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Consts().greyColor.withOpacity(0.2),
              ),
            ),
            child: Image(image: AssetImage("assets/images/paytm.png")),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Paytm",
            style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold, fontSize: Consts.stitle2),
          ),
        ],
      ),
    );
  }

  Widget _gpay() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Consts().greyColor.withOpacity(0.2),
              ),
            ),
            child: Image(image: AssetImage("assets/images/paytm.png")),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "G-Pay",
            style: GoogleFonts.openSans(
              fontWeight: FontWeight.bold,
              fontSize: Consts.stitle2,
            ),
          ),
        ],
      ),
    );
  }
}
