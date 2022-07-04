import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/order_screen/img_verify.dart';
import 'package:bee/screens/profile_screen/acc_details.dart';
import 'package:bee/screens/profile_screen/address.dart';
import 'package:bee/screens/profile_screen/empty_notify.dart';
import 'package:bee/screens/profile_screen/estimate1.dart';
import 'package:bee/screens/profile_screen/estimate2.dart';
import 'package:bee/screens/profile_screen/notifications.dart';
import 'package:bee/screens/profile_screen/order_history.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                CustomAppBar(height: height, width: width),
                SizedBox(
                  height: 5,
                ),
                profileBanner(
                  width: width,
                  height: height,
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      menuBlock(
                          title: "Account Details",
                          width: width,
                          icon: "m1",
                          onpress: () {
                            pushNewScreen(
                              context,
                              screen: AccountDetails(),
                            );
                          }),
                      menuBlock(
                          title: "Order History",
                          width: width,
                          icon: "m2",
                          onpress: () {
                            pushNewScreen(
                              context,
                              screen: OrderHistory(),
                            );
                          }),
                      menuBlock(title: "My Car", width: width, icon: "m3"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      menuBlock(
                          title: "Health Card",
                          width: width,
                          icon: "m4",
                          onpress: () {
                            pushNewScreen(
                              context,
                              screen: EstimateTwo(),
                            );
                          }),
                      menuBlock(
                        title: "Address",
                        width: width,
                        icon: "m5",
                        onpress: () {
                          pushNewScreen(
                            context,
                            screen: ProfileAddress(),
                          );
                        },
                      ),
                      menuBlock(
                          title: "Notification",
                          width: width,
                          icon: "m6",
                          onpress: () {
                            pushNewScreen(
                              context,
                              screen: GetNotification(),
                            );
                          }),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 24, right: 10, top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      menuBlock(
                        title: "Image Verification *",
                        width: width,
                        icon: "m7",
                        onpress: () {
                          pushNewScreen(
                            context,
                            screen: ImgVerification(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                myContainer(
                  borderColor: Theme.of(context).primaryColor,
                  customPadding:
                      EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 24),
                        child: Consts.titleText(
                          text: "Log Out",
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Container(),
                    ],
                  ),
                  width: width,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileBanner({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height * 0.25,
      // decoration: BoxDecoration(
      //   color: Colors.yellow.shade200,
      // ),

      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.topRight,
            stops: [0.5, 0]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consts.titleText(text: "My Profile"),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 5,
                  ),
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: CircleAvatar(
                  maxRadius: 35,
                  minRadius: 33,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                child: Consts.titleText(text: "Shubham Verma"),
              ),
              Container(
                child: Consts.titleText2(text: "+91-9876543210"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget menuBlock({
    required String title,
    required double width,
    required String icon,
    Function()? onpress,
  }) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: width * 0.25,
        height: width * 0.25,
        decoration: BoxDecoration(
            border: Border.all(color: Consts().greyColor.withOpacity(0.2))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                  child: Image(image: AssetImage("assets/images/$icon.png"))),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                child: FittedBox(child: Consts.titleText2(text: title)),
              ),
            ]),
      ),
    );
  }
}
