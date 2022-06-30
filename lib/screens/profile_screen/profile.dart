import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/profile_screen/acc_details.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
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
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              CustomAppBar(height: height, width: width),
              profileBanner(
                width: width,
                height: height,
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    menuBlock(title: "Order History", width: width, icon: "m2"),
                    menuBlock(title: "My Car", width: width, icon: "m3"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    menuBlock(title: "Health Card", width: width, icon: "m4"),
                    menuBlock(title: "Address", width: width, icon: "m5"),
                    menuBlock(title: "Notification", width: width, icon: "m6"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    menuBlock(
                        title: "Image Verification *",
                        width: width,
                        icon: "m7"),
                  ],
                ),
              ),
            ],
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
      decoration: BoxDecoration(
        color: Colors.yellow.shade200,
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "My Profile",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            leading: MyBackButton(),
          ),
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
            child: Stack(
              children: [
                CircleAvatar(
                  maxRadius: 25,
                  minRadius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Consts.titleText(text: "Shubham Verma"),
          ),
          Container(
            child: Consts.titleText2(text: "+91-9876543210"),
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
        width: width * 0.3,
        height: width * 0.3,
        decoration: BoxDecoration(
            border: Border.all(color: Consts().greyColor.withOpacity(0.2))),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Container(
                  child: Image(image: AssetImage("assets/images/$icon.png"))),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Consts.titleText2(text: title),
              ),
            ]),
      ),
    );
  }
}
