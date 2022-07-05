import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          body: Container(
            width: width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomAppBar(height: height, width: width),
                      AppBar(
                        backgroundColor: Colors.white,
                        title: Text(
                          "About Us",
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
                    width: width * 0.9,
                    height: height * 0.18,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image(
                      image: AssetImage("assets/images/about1.png"),
                    ),
                  ),
                  Divider(
                    height: height * 0.01,
                    color: Colors.transparent,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.9,
                    child: Consts.titleText3(
                      minfsize: 12,
                      text:
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim ",
                    ),
                  ),
                  Divider(
                    height: height * 0.01,
                    color: Colors.transparent,
                  ),
                  Container(
                      alignment: Alignment.center,
                      width: width * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Column(children: [
                                Consts.titleText(text: "Our Story"),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: width * 0.9,
                                  child: Consts.titleText3(
                                    minfsize: 12,
                                    text:
                                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim ",
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              child: Image(
                                image: AssetImage("assets/images/about2.png"),
                              ),
                            ),
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: width * 0.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Image(
                              image: AssetImage("assets/images/about2.png"),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            child: Column(children: [
                              Consts.titleText(text: "Our Story"),
                              SizedBox(
                                height: 15,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: width * 0.9,
                                child: Consts.titleText3(
                                  minfsize: 12,
                                  text:
                                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim Lorem ipsum dolor sit amet, consectetur adipiscing elit upiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna fringilla urna, porttitor rhoncus dolor purus non enim ",
                                ),
                              ),
                            ]),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                    ),
                    child: Center(
                      child: Consts.titleText(text: "Ethics We Follow"),
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: width * 0.3,
                                child: Image(
                                  image: AssetImage("assets/images/about3.png"),
                                ))),
                        Flexible(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: width * 0.3,
                                child: Image(
                                  image: AssetImage("assets/images/about5.png"),
                                ))),
                        Flexible(
                            flex: 1,
                            child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 5),
                                width: width * 0.3,
                                child: Image(
                                  image: AssetImage("assets/images/about4.png"),
                                ))),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: width * 0.3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Consts.titleText(text: "Fun At Work"),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: width * 0.3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: Consts.titleText(text: "Team Work"),
                              ),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: width * 0.3,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 10.0),
                                child: FittedBox(
                                  child: Consts.titleText(
                                      text: "Continuous Learning"),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  Container(
                    width: width * 0.9,
                    alignment: Alignment.center,
                    child: Row(
                      children: [
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: width * 0.3,
                              child: Consts.titleText3(
                                  minfsize: 10,
                                  text:
                                      "People only get succeed when the working atmosphere is fun loving"),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: width * 0.3,
                              child: Consts.titleText3(
                                  minfsize: 10,
                                  text:
                                      "Great things in business are never done by one person.They're done by a team of people"),
                            )),
                        Flexible(
                            flex: 1,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              width: width * 0.3,
                              child: Consts.titleText3(
                                  minfsize: 10,
                                  text:
                                      "Making mistakes simply means you are learning faster"),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: height * 0.08,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/bg.png"),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Consts.titleText2(
                              text:
                                  "lorem Ipsum Dolor Sit lorem Ipsum Dolor Sitlorem Ipsum Dolor Sit",
                              color: Colors.white),
                        ),
                        Flexible(
                            flex: 3,
                            child: LongButton(
                              height: 30,
                              width: width * 0.25,
                              onpress: () {},
                              title: "Join Us",
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
