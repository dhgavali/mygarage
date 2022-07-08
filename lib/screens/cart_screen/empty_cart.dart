import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/screens/home_screen/service2_page.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/services/auth/authentication.dart';
import 'package:bee/services/dbmethods.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../global_widgets/cutom_appbar.dart';

/// page to select services to add inside the cart
class EmptyCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        // TODO: make global
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(height: height, width: width),
            Divider(height: height * 0.02, color: Colors.transparent),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AutoSizeText(
                        "Cart",
                        maxFontSize: 22,
                        minFontSize: 10,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: AutoSizeText(
                            "No Services Added Yet",
                            maxFontSize: 22,
                            minFontSize: 10,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w900),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Center(
                          child: AutoSizeText(
                            "Your cart is empty",
                            maxFontSize: 22,
                            minFontSize: 10,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Center(
                          child: Image(
                            image: AssetImage(
                              "assets/images/cart.png",
                            ),
                            width: 130,
                            height: 130,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Center(
                          child: AutoSizeText(
                            "Book Services Now",
                            maxFontSize: 22,
                            minFontSize: 10,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        BookButton(
                            width: width,
                            height: 40,
                            onpress: () async {
                              // DocumentSnapshot res =
                              //     await DbMethods().getData("sfsafsf");
                              // print(FirebaseAuth
                              //     .instance.currentUser!.phoneNumber!
                              //     .substring(1));
                              // print("document ${res.exists} ");
                              pushNewScreen(context,
                                  screen: ServiceTwoPage(),
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino);
                            },
                            title: "Book Services")
                      ],
                    ),
                    Container(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
