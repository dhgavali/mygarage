import 'package:bee/screens/service_select/on_sos_selected.dart';
import 'package:bee/screens/service_select/select_vehicle.dart';
import 'package:bee/screens/service_select/select_service_screen.dart';
import 'package:bee/screens/sos_screen/sos_screen.dart';
import 'package:bee/utils/routes.dart';
import 'package:flutter/material.dart';

import 'utils/themes.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Themes().lightTheme,
      initialRoute: RouteName.Select_service_screen,
      routes: {
        RouteName.Select_service_screen: (context) => SelectServiceScreen(),
        RouteName.Select_vehicle_screen: (context) => VechicleBrandModel(),
        RouteName.Select_SOS_screen: (context) => SelectSOSScreen(),
        RouteName.SOS_screen: (context) => SosScreen(),
      },
    );
  }
}
