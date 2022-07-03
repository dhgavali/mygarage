import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

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
                    "Contact Us",
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
          ]),
        ),
      ),
    ));
  }
}
