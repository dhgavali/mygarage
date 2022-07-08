import 'package:bee/screens/other/current_location.dart';
import 'package:bee/screens/other/map_package.dart';
import 'package:flutter/material.dart';

class MapViewPage extends StatefulWidget {
  final double latitude;
  final double longitude;

  const MapViewPage({required this.latitude, required this.longitude});
  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  double latitude = 23;

  double longitude = 89;
  CurrentLocation _cl = CurrentLocation();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.latitude = widget.latitude;
    this.longitude = widget.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpenStreetMapSearchAndPick(
        center: LatLong(latitude, longitude),
        onPicked: (pickedData) {
          setState(() {
            latitude = pickedData.latLong.latitude;
            longitude = pickedData.latLong.longitude;
          });
          print(pickedData.latLong.latitude);
          print(pickedData.latLong.longitude);
          print(pickedData.address);
          _cl.address = pickedData.address;
          Navigator.pop(context);
        },
      ),
    );
  }
}
