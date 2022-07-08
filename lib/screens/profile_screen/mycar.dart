import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/profile_screen/mycar_edit.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class MyCarHome extends StatelessWidget {
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
                        "My Car",
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
                Cardetails(
                  reg_no: "MG545454",
                  purchase_year: "2015",
                  km_driven: "2000 km",
                ),
                Container(
                  height: 50,
                  child: TextButton.icon(
                      style: TextButton.styleFrom(primary: Colors.red),
                      onPressed: () {
                        pushNewScreen(
                          context,
                          screen: MyCarEdit(),
                        );
                      },
                      icon: Icon(Icons.rate_review_rounded),
                      label: Text("Edit")),
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
  final bool isSelected;

  const CarCard({this.isSelected = true});

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isSelected
              ? Container(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    color: Colors.grey,
                    child: Consts.titleText(
                      text: "Selected",
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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
              Container(
                width: width * 0.33,
                height: height * 0.12,
                child: Image(
                  image: AssetImage("assets/images/thar_big.png"),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Container(
                child: Consts.titleText2(
                  text: "Change",
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Container(),
        ],
      ),
    );
  }
}
