import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class HealthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
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
                        "Health Card",
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
                DirectionButtons(),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                CarCard(),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                myContainer(
                  width: width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      HealthBlock(
                          width: width * 0.9,
                          healthline: HealthLine(
                            width: width * 0.9 * 0.6,
                            critical: 0.2,
                            medium: 0.3,
                            good: 0.5,
                          ),
                          icon: Icons.settings_outlined,
                          title: "Overall Service"),
                      HealthBlock(
                          width: width * 0.9,
                          healthline: HealthLine(
                              width: width * 0.9 * 0.6,
                              critical: 0.2,
                              medium: 0.3,
                              good: 0.5),
                          isSvg: true,
                          svgpath: "assets/images/engine.png",
                          icon: Icons.settings_outlined,
                          title: "Engine"),
                      HealthBlock(
                          width: width * 0.9,
                          healthline: HealthLine(
                              width: width * 0.9 * 0.6,
                              critical: 0.2,
                              medium: 0.3,
                              good: 0.5),
                          icon: Icons.oil_barrel_outlined,
                          title: "Oil"),
                      HealthBlock(
                        width: width * 0.9,
                        healthline: HealthLine(
                            width: width * 0.9 * 0.6,
                            critical: 0.2,
                            medium: 0.3,
                            good: 0.5),
                        icon: Icons.settings_outlined,
                        isSvg: true,
                        svgpath: "assets/images/tyre.png",
                        title: "Tyre",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class Cardetails extends StatelessWidget {
  final String reg_no;
  final String purchase_year;
  final String km_driven;

  const Cardetails(
      {required this.reg_no,
      required this.purchase_year,
      required this.km_driven});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return myContainer(
        width: width * 0.95,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _rowData("Registration Number", reg_no),
            _rowData("Purchase Year", purchase_year),
            _rowData("Kilometer Driven", km_driven),
          ],
        ));
  }

  Widget _rowData(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Consts.titleText2(text: title),
        ),
        Container(
          child: Consts.titleText2(text: value),
        ),
      ],
    );
  }
}

class DirectionButtons extends StatelessWidget {
  const DirectionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              child: Text(
                "/",
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width * 0.9,
      height: height * 0.25,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.topRight,
            stops: [0.5, 0]),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 5.0,
            blurRadius: 5,
          ),
        ],
      ),
      child: Stack(
        // mainAxisAlignment: MainAxisAlignment.center,
        alignment: AlignmentDirectional.center,
        children: [
          Positioned(
            left: 10,
            child: Container(
              padding: EdgeInsets.only(
                bottom: 40,
              ),
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consts.titleText(
                      text: "Mahendra Thar",
                      color: Colors.white,
                    ),
                    Consts.titleText2(
                      text: "Diesel",
                    ),
                  ]),
            ),
          ),
          Positioned(
            top: height * 0.25 * 0.25,
            child: Container(
              width: width * 0.33,
              height: height * 0.12,
              child: Image(
                image: AssetImage("assets/images/thar_big.png"),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              right: 0,
              child: Container(
                width: width * 0.3,
                child: Column(children: [
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 10,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          "Working Fine",
                          minFontSize: 8,
                          maxFontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 10,
                        color: Colors.yellow[800],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          "Get Service on sheduled time",
                          minFontSize: 8,
                          maxFontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        width: 20,
                        height: 10,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Flexible(
                        child: AutoSizeText(
                          "Urgent maintainance required",
                          minFontSize: 8,
                          maxFontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ]),
              ))
        ],
      ),
    );
  }
}

class HealthLine extends StatelessWidget {
  final double critical;
  final double medium;
  final double good;
  final double width;

  const HealthLine(
      {required this.width,
      required this.critical,
      required this.medium,
      required this.good});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.red,
          height: 5,
          width: width * critical,
        ),
        Container(color: Colors.yellow[800], height: 5, width: width * medium),
        Container(
          color: Colors.green,
          height: 5,
          width: width * good,
        ),
      ],
    );
  }
}

class HealthBlock extends StatelessWidget {
  final double width;
  final Widget healthline;
  final IconData icon;
  final String title;
  final bool isSvg;
  final String svgpath;
  HealthBlock({
    required this.healthline,
    required this.icon,
    required this.title,
    required this.width,
    this.isSvg = false,
    this.svgpath = "",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isSvg
                      ? Container(
                          child: Image(
                            image: AssetImage(
                              svgpath,
                            ),
                            width: 30,
                            height: 30,
                          ),
                        )
                      : Icon(
                          icon,
                          size: 30,
                          color: Colors.grey,
                        ),
                  FittedBox(child: Consts.titleText2(text: title)),
                ],
              ),
            ),
          ),
          healthline,
        ],
      ),
    );
  }
}
