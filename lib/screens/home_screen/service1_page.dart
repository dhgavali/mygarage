import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../global_widgets/cutom_appbar.dart';
import 'home_page.dart';
import 'service2_page.dart';

class ServiceOnePage extends StatelessWidget {
  const ServiceOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomAppBar(height: height, width: width),
            Divider(height: height * 0.01, color: Colors.transparent),
            SearchBar(height: height, width: width),
            Divider(height: height * 0.01, color: Colors.transparent),
            ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: height * 0.2,
                  maxWidth: width,
                ),
                child: Swiper(
                  itemCount: 5,
                  viewportFraction: 0.85,
                  scale: 0.95,
                  index: 0,
                  pagination: SwiperPagination(
                      builder: SwiperPagination.dots,
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(top: 10)),
                  itemBuilder: (ctx, ind) => Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey),
                  ),
                )),
            Divider(height: height * 0.01, color: Colors.transparent),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "Our Services",
                            maxFontSize: 22,
                            minFontSize: 10,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                          AutoSizeText(
                            "See All",
                            maxFontSize: 22,
                            minFontSize: 10,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF305088)),
                          ),
                        ],
                      ),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      ServiceGridTileOne(height: height, width: width),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      AutoSizeText(
                        "Trending",
                        maxFontSize: 22,
                        minFontSize: 10,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TrendingTile(
                            height: height,
                            width: width,
                            gradient: [Colors.red, Colors.red.shade300],
                            title: 'Complete Car Service',
                            label: 'Offer Price Rs 999',
                          ),
                          TrendingTile(
                            height: height,
                            width: width,
                            gradient: [Colors.indigo, Colors.indigo.shade300],
                            title: 'Complete Car Service',
                            label: 'Offer Price Rs 999',
                          ),
                          TrendingTile(
                            height: height,
                            width: width,
                            gradient: [Colors.green, Colors.green.shade300],
                            title: 'Complete Car Service',
                            label: 'Offer Price Rs 999',
                          ),
                          TrendingTile(
                            height: height,
                            width: width,
                            gradient: [Colors.black, Colors.grey.shade300],
                            title: 'Complete Car Service',
                            label: 'Offer Price Rs 999',
                          ),
                        ],
                      ),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      RedStripWidget(height: height),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      AutoSizeText("Happy Costumers",
                          maxFontSize: 22,
                          minFontSize: 10,
                          maxLines: 1,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.w700)),
                      Divider(height: height * 0.02, color: Colors.transparent),
                      Container(
                        height: height * 0.25,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AutoSizeText(
                              "Expert Care",
                              maxFontSize: 28,
                              minFontSize: 16,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red.shade900),
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut",
                              maxFontSize: 16,
                              minFontSize: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  radius: (height / width) * 10,
                                ),
                                SizedBox(width: 5),
                                AutoSizeText(
                                  "Amit Kumar",
                                  maxFontSize: 12,
                                  minFontSize: 5,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "1 month ago",
                                  maxFontSize: 12,
                                  minFontSize: 5,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(height: height * 0.02, color: Colors.transparent),
                      Container(
                        height: height * 0.25,
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AutoSizeText(
                              "Expert Care",
                              maxFontSize: 28,
                              minFontSize: 16,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.red.shade900),
                            ),
                            AutoSizeText(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut",
                              maxFontSize: 16,
                              minFontSize: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.grey.shade400,
                                  radius: (height / width) * 10,
                                ),
                                SizedBox(width: 5),
                                AutoSizeText(
                                  "Amit Kumar",
                                  maxFontSize: 12,
                                  minFontSize: 5,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                Spacer(),
                                AutoSizeText(
                                  "1 month ago",
                                  maxFontSize: 12,
                                  minFontSize: 5,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText2!
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceGridTileOne extends StatelessWidget {
  const ServiceGridTileOne({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  static const List<String> img = [
    'vector',
    'vector1',
    'setting',
    'vector',
    'vector1',
    'setting',
    'vector',
    'vector1',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, crossAxisSpacing: 5, mainAxisSpacing: 10),
      itemCount: 8,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => pushNewScreen(context,
            screen: ServiceTwoPage(),
            pageTransitionAnimation: PageTransitionAnimation.cupertino),
        child: Container(
          height: height * 0.12,
          width: width * 0.25,
          child: GridTile(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade100,
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 50,
                    right: 10,
                    child: Image.asset(
                      "assets/images/arrow.png",
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: Container(
                      height: height * 0.04,
                      width: height * 0.04,
                      child: CustomPaint(
                        painter: ArcPainter(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: Image.asset(
                      "assets/images/${img[index]}.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: Container(
                      alignment: Alignment.center,
                      height: height * 0.015,
                      width: width * 0.10,
                      color: Colors.green,
                      child: AutoSizeText(
                        "Recommended",
                        maxFontSize: 7,
                        minFontSize: 5,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            header: Container(
              alignment: Alignment.center,
              height: height * 0.02,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                color: Theme.of(context).primaryColor,
              ),
              child: AutoSizeText(
                "Lorem Ipsum",
                maxFontSize: 10,
                minFontSize: 5,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
