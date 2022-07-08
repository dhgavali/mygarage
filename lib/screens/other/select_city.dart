import 'dart:collection';

import 'package:bee/screens/other/current_location.dart';
import 'package:bee/screens/other/maps.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class SelectCityPage extends StatelessWidget {
  Future<LocationData?> checkpermision() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();
    return _locationData;
  }

  CurrentLocation _cl = CurrentLocation();
  @override
  Widget build(BuildContext context) {
    print(_cl.mylocation);
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
                  onTap: () async {
                    LocationData? _location = await checkpermision();
                    if (_location == null) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text("Please allow location from settings")));
                    } else {
                      pushNewScreen(context,
                          screen: MapViewPage(
                            latitude: _location.latitude!,
                            longitude: _location.longitude!,
                          ));
                    }
                  },
                  leading: Transform.rotate(
                    angle: 45,
                    child: Icon(
                      Icons.navigation,
                    ),
                  ),
                  horizontalTitleGap: 0,
                  title: Text("Detect My Location"),
                  subtitle: Text("Using GPS "),
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
