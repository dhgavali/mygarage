import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/home_screen/service1_page.dart';
import 'package:bee/services/auth/authentication.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import '../sos_screen/sos_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
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
                      ServiceGridTile(height: height, width: width),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AutoSizeText(
                            "Our Shops",
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
                      ServiceGridTile(height: height, width: width),
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

class RedStripWidget extends StatelessWidget {
  const RedStripWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.08,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/bg.png"), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.settings, color: Colors.white),
              AutoSizeText(
                "Geniune Parts",
                maxFontSize: 12,
                minFontSize: 5,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.car_repair_outlined, color: Colors.white),
              AutoSizeText(
                "2 Free Services",
                maxFontSize: 12,
                minFontSize: 5,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.person_outline, color: Colors.white),
              AutoSizeText(
                "Exprience Staff",
                maxFontSize: 12,
                minFontSize: 5,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.watch_later_outlined, color: Colors.white),
              AutoSizeText(
                "Time Management",
                maxFontSize: 12,
                minFontSize: 5,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TrendingTile extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final String label;
  final List<Color> gradient;

  const TrendingTile(
      {super.key,
      required this.height,
      required this.width,
      required this.title,
      required this.label,
      required this.gradient});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.12,
      width: width * 0.22,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: gradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.5, 0])),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: (height / width) * 8,
              backgroundImage: AssetImage("assets/images/circleAvtar.png"),
            ),
            AutoSizeText(
              title,
              maxFontSize: 12,
              minFontSize: 5,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.all(2),
              height: height * 0.015,
              color: Colors.black,
              child: AutoSizeText(
                label,
                maxFontSize: 12,
                minFontSize: 5,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: Colors.white),
              ),
            ),
            AutoSizeText(
              "Book Now",
              maxFontSize: 12,
              minFontSize: 5,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceGridTile extends StatelessWidget {
  const ServiceGridTile({
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
            screen: ServiceOnePage(),
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

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.red
      ..style = PaintingStyle.stroke;

    final arc = Path();
    arc.arcToPoint(Offset(size.height * 0.95, size.width * 0.95),
        radius: Radius.circular(15));
    canvas.drawPath(arc, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
