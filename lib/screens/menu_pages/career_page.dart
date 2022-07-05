import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/menu_pages/career_details.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class CareerPage extends StatefulWidget {
  @override
  State<CareerPage> createState() => _CareerPageState();
}

class _CareerPageState extends State<CareerPage> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    _controller = new TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    child: TabBar(
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: BubbleTabIndicator(
                        indicatorHeight: 25.0,
                        indicatorColor: Colors.red,
                        indicatorRadius: 5,
                        tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      ),
                      controller: _controller,
                      unselectedLabelColor: Colors.black,
                      labelColor: Colors.white,
                      onTap: (index) {
                        print(index);
                      },
                      tabs: [
                        Tab(
                          child: Text(
                            "All",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Tab(
                            child: Text(
                          "Analytics",
                          style: TextStyle(fontSize: 12),
                        )),
                        Tab(
                          child: Text(
                            "Custom Services",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Ac services",
                            style: TextStyle(fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    height: height * 0.01,
                    color: Colors.transparent,
                  ),
                  JobBox(),
                  JobBox(),
                  JobBox(),
                ],
              ),
            ),
          )),
    );
  }
}

class JobBox extends StatelessWidget {
  const JobBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return myContainer(
        width: width * 0.95,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Consts.titleText(
                    text: "React Native Developer",
                    color: Colors.red,
                  ),
                  AutoSizeText(
                    "2 Weeks ago",
                    minFontSize: 10,
                    maxFontSize: 14,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                "2-5 Experience",
                minFontSize: 10,
                maxFontSize: 14,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                "No. of vacancy : 05",
                minFontSize: 10,
                maxFontSize: 14,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 16),
              alignment: Alignment.topLeft,
              child: AutoSizeText(
                "Location : NCR, West part, \nTown area",
                minFontSize: 10,
                maxFontSize: 14,
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  pushNewScreen(
                    context,
                    screen: CareerDetails(),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.red,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "Apply",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
