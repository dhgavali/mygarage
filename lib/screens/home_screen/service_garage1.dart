import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/home_screen/home_page.dart';
import 'package:bee/screens/home_screen/service_garage2.dart';
import 'package:bee/screens/home_screen/widgets.dart';
import 'package:bee/utils/constants.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ServiceGarageOne extends StatelessWidget {
  final List<String> _images = [
    "assets/images/blog1.png",
    "assets/images/blog1.png",
    "assets/images/blog1.png",
    "assets/images/blog1.png",
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  children: [
                    CustomAppBar(height: height, width: width),
                  ],
                ),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                SearchBar(
                  height: height,
                  width: width,
                  hint: "Search Services & Garage",
                ),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: height * 0.2,
                      maxWidth: width,
                      minHeight: height * 0.17,
                    ),
                    child: Swiper(
                      axisDirection: AxisDirection.left,
                      // containerWidth: width * 0.75,
                      itemCount: 4,
                      viewportFraction: 0.7,
                      scale: 0.95,
                      index: 0,
                      pagination: SwiperPagination(
                          builder: SwiperPagination.dots,
                          alignment: Alignment.bottomCenter,
                          margin: EdgeInsets.only(top: 10)),
                      itemBuilder: (ctx, ind) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                        ),
                        child: Image(
                          image: AssetImage(
                            _images[ind],
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.topLeft,
                  child: Consts.titleText(text: "Our Shops"),
                ),
                SizedBox(
                  height: 10,
                ),
                ShopDetailBox(),
                SizedBox(
                  height: 10,
                ),
                ShopDetailBox(),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: RedStripWidget(
                    height: height,
                    maxfont: 10,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.centerLeft,
                    child: Consts.titleText2(text: "Know About Our Service")),
                SizedBox(
                  height: 10,
                ),
                VideoWidget(width: width, height: height),
                SizedBox(
                  height: 10,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.centerLeft,
                    child: Consts.titleText2(text: "Happy Customers")),
                ExperCareBox(),
                ExperCareBox(),
                Center(
                  child: TextButton(
                    style: ButtonStyle(
                      splashFactory:
                          InkSparkle.constantTurbulenceSeedSplashFactory,
                      // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      minimumSize: MaterialStateProperty.all(const Size(0, 5)),
                    ),
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Color(
                          0xff305088,
                        ),
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  alignment: Alignment.centerLeft,
                  child: Consts.titleText2(text: "FAQs"),
                ),
              ],
            ),
          )),
    );
  }
}

class ShopDetailBox extends StatelessWidget {
  // final Function onpress;

  // const ShopDetailBox({required this.onpress});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        pushNewScreen(context, screen: ServiceGarageTwo());
      },
      child: Container(
        width: width * 0.95,
        height: height * 0.30,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(children: [
          Flexible(
            flex: 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Container(
                width: width,
                child: Image(
                  image: AssetImage("assets/images/shop.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 6,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Consts.titleText(text: "Car Bajaar"),
                            Consts.titleText2(
                                text: "20+ Experience in this field"),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.red,
                            ),
                            Text("4.5"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  dashLine(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        featureName(),
                        featureName(),
                        featureName(),
                        featureName(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        featureName(),
                        featureName(),
                        featureName(),
                        featureName(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  dashLine(),
                  SizedBox(
                    height: 5,
                  ),
                  HighLight(),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class HighLight extends StatelessWidget {
  const HighLight({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Consts.titleText3(text: "Germ Free interior", minfsize: 10)
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Consts.titleText3(text: "Germ Free interior", minfsize: 10)
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.check_circle,
                color: Colors.green,
                size: 16,
              ),
              SizedBox(
                width: 5,
              ),
              Consts.titleText3(text: "Germ Free interior", minfsize: 10)
            ],
          ),
        ],
      ),
    );
  }
}
