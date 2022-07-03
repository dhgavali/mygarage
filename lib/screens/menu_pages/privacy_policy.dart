import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Column(
              children: [
                CustomAppBar(height: height, width: width),
                AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Privacy Policy",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  centerTitle: true,
                  elevation: 0.0,
                  leading: MyBackButton(),
                ),
              ],
            ),
            Divider(
              height: height * 0.01,
              color: Colors.transparent,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.topRight,
                child: AutoSizeText(
                  "Updated 16 April 2021",
                  minFontSize: 10,
                  maxFontSize: 12,
                )),
            Divider(
              height: height * 0.02,
              color: Colors.transparent,
            ),
            overview(title: "title", body: ""),
            overview(title: "title", body: ""),
            overview(title: "title", body: ""),
          ]),
        ),
      ),
    ));
  }

  Widget overview({required String title, required String body}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Consts.titleText(text: "Overview"),
          ),
          Container(
            child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate v"),
          ),
        ],
      ),
    );
  }
}
