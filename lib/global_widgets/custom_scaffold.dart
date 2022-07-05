import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/menu_pages/about_us.dart';
import 'package:bee/screens/menu_pages/be_partner.dart';
import 'package:bee/screens/menu_pages/blogs.dart';
import 'package:bee/screens/menu_pages/career_page.dart';
import 'package:bee/screens/menu_pages/contact_us.dart';
import 'package:bee/screens/menu_pages/faq.dart';
import 'package:bee/screens/menu_pages/partner_list.dart';
import 'package:bee/screens/menu_pages/privacy_policy.dart';
import 'package:bee/screens/menu_pages/terms_of_service.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  CustomScaffold({
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        key: _key,
        backgroundColor: Colors.white,
        body: Container(
          child: Column(children: [
            CustomAppBar(
              height: height,
              width: width,
            ),
            // Divider(
            //   height: height * 0.01,
            //   color: Colors.transparent,
            // ),
            body,
          ]),
        ),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  width: width * 0.8,
                  child: Column(
                    children: [
                      Container(
                        height: 130,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xffFF0000).withOpacity(0.9),
                            Color(0xff999999).withOpacity(0.8),
                          ]),
                        ),
                        alignment: Alignment.bottomCenter,
                        padding: EdgeInsets.only(left: 20, bottom: 5),
                        child: Text(
                          "Shubham Verma",
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        padding: EdgeInsets.all(8),
                        child: Text(
                          "+91-9876543210",
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: CircleAvatar(
                    radius: 35,
                    child: Image(
                      image: AssetImage(
                        "assets/images/profile.png",
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Color(0xff305088),
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: AutoSizeText(
                    "Change Location",
                    minFontSize: 8,
                    maxFontSize: 16,
                    style: TextStyle(
                      color: Color(0xff305088),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Row(children: [
                    Icon(
                      Icons.edit_location_outlined,
                      size: 10,
                    ),
                    Text(
                      "Sector-03, Patna, Bihar",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xff305088),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                  ]),
                ),
              ]),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            onTap: () {
                  pushNewScreen(
                context,
                screen: AboutUs(),
              );
            },
            title: Consts.titleText(text: "ABOUT US"),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: ContactUs(),
              );
            },
            title: Consts.titleText(text: "CONTACT US 23X7"),
          ),
          ListTile(
            onTap: () {
                  pushNewScreen(
                context,
                screen: BlogsPage(),
              );
            },
            title: Consts.titleText(text: "BLOGS"),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: BePartner(),
              );
            },
            title: Consts.titleText(text: "BECOME OUR PARTNER"),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: PartnerList(),
              );
            },
            title: Consts.titleText(text: "OUR PARTNERS"),
          ),
          ListTile(
            minVerticalPadding: 0,
            onTap: () {
                  pushNewScreen(
                context,
                screen: CareerPage(),
              );
            },
            title: Consts.titleText(text: "CAREER"),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: Faq(),
              );
            },
            title: Consts.titleText(text: "FAQs"),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: TermsOfService(),
              );
            },
            title: Consts.titleText(text: "TERMS OF SERVICE"),
          ),
          ListTile(
            onTap: () {
              pushNewScreen(
                context,
                screen: PrivacyPolicy(),
              );
            },
            title: Consts.titleText(text: "PRIVACY POLICY"),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
    );
  }
}
