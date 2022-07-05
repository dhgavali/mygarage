import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';

class CareerDetails extends StatelessWidget {
  const CareerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameContro = TextEditingController();
    TextEditingController _phoneContro = TextEditingController();
    TextEditingController _emailContro = TextEditingController();

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomAppBar(height: height, width: width),
                      AppBar(
                        backgroundColor: Colors.white,
                        title: Text(
                          "Career",
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
                  Center(
                    child: Consts.titleText3(
                        text: "React Native Developer", minfsize: 18),
                  ),
                  Divider(
                    height: height * 0.025,
                    color: Colors.transparent,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Roles & Responsibility : ",
                      minFontSize: 18,
                      maxFontSize: 22,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      bulletRow(),
                      bulletRow(),
                      bulletRow(),
                      bulletRow(),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.centerLeft,
                    child: AutoSizeText(
                      "Requirement :",
                      minFontSize: 18,
                      maxFontSize: 22,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(children: [
                      bulletRow(),
                      bulletRow(),
                      bulletRow(),
                      bulletRow(),
                    ]),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          cInputField(
                            label: "Full Name",
                            context: context,
                            hint: "Shubham Verma",
                            txController: _nameContro,
                            valids: Validators.novalid,
                          ),
                          cInputField(
                            label: "Phone Number",
                            context: context,
                            hint: "+91-8984585125",
                            txController: _phoneContro,
                            keyboard: TextInputType.phone,
                            valids: Validators.mobValid,
                          ),
                          cInputField(
                            label: "Email Id",
                            context: context,
                            hint: "abc@gmail.com",
                            txController: _emailContro,
                            keyboard: TextInputType.emailAddress,
                            valids: Validators.emailValid,
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            alignment: Alignment.topLeft,
                            child: Consts.titleText(
                              text: "Upload Resume",
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.1),
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.grey.shade200,
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    "Choose File",
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "No File Choosen",
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                              height: height * 0.05, color: Colors.transparent),
                          LongButton(
                              width: width * 0.9,
                              height: 40,
                              title: "Apply",
                              onpress: () {
                                Navigator.of(context).maybePop();
                              }),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

class bulletRow extends StatelessWidget {
  const bulletRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 10,
          ),
          SizedBox(
            width: 10,
          ),
          AutoSizeText(
            "Lorem Ipsum Dolor Sit",
            minFontSize: 16,
            maxFontSize: 18,
          )
        ],
      ),
    );
  }
}
