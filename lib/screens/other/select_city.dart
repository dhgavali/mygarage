import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class SelectCityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text(
              "Select City",
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            leading: MyBackButton(),
          ),
          body: Container(
            child: Column(
              children: [
                ListTile(
                  leading: Transform.rotate(
                    angle: 45,
                    child: Icon(
                      Icons.navigation,
                    ),
                  ),
                  horizontalTitleGap: 0,
                  title: Text("Detect My Location"),
                  subtitle: Text("Using GPS"),
                ),
                Container(
                  width: width,
                  height: 40,
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.centerLeft,
                  color: Colors.grey.shade400,
                  child: Consts.titleText(
                    text: "Cities we serve",
                    color: Color(0xff777777),
                  ),
                ),
                CityList(),
              ],
            ),
          )),
    );
  }
}

class CityList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      child: Table(
        children: [
          TableRow(children: [
            citybox(width),
            citybox(width),
            citybox(width),
          ]),
          TableRow(children: [
            citybox(width),
            citybox(width),
            citybox(width),
          ]),
          TableRow(children: [
            citybox(width),
            citybox(width),
            citybox(width),
          ]),
        ],
      ),
    );
  }

  Widget citybox(double width) {
    return Container(
      width: width * 0.3,
      height: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withOpacity(
            0.2,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.location_city,
            color: Colors.grey,
            size: 34,
          ),
          SizedBox(
            height: 10,
          ),
          Consts.titleText(text: "Lorem Ipsum"),
        ],
      ),
    );
  }
}
