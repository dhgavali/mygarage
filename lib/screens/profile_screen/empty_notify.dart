import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:flutter/material.dart';

class EmptyNotifs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Container(
            height: height * 0.8,
            child: Column(
              children: [
                Column(
                  children: [
                    CustomAppBar(height: height, width: width),
                    AppBar(
                      backgroundColor: Colors.white,
                      title: Text(
                        "Notifications",
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
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: width * 0.3,
                        height: width * 0.3,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: Container(
                          alignment: Alignment.center,
                          width: width * 0.22,
                          height: width * 0.22,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image(
                            image: AssetImage(
                              "assets/images/nots.png",
                            ),
                            width: width * 0.08,
                          ),
                        ),
                      ),
                      Divider(
                        height: height * 0.025,
                        color: Colors.transparent,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                        ),
                        child: AutoSizeText(
                          "You don't have any notifications",
                          minFontSize: 12,
                          maxFontSize: 18,
                        ),
                      )
                    ],
                  ),
                ),
                Container(),
              ],
            ),
          )),
    );
  }
}
