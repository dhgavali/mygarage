import 'package:auto_size_text/auto_size_text.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';

class SosScreen extends StatelessWidget {
  const SosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        body: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                CustomAppBar(height: height, width: width),
                Divider(height: height * 0.05, color: Colors.transparent),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: height * 0.25,
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
                Divider(height: height * 0.05, color: Colors.transparent),
                Container(
                  width: width * 0.95,
                  height: height * 0.25,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage("assets/images/mask.png"),
                          fit: BoxFit.cover)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Divider(height: height * 0.01),
                      Text(
                        "Request a call",
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      Divider(height: height * 0.01),
                      Text("Don’t know what to your vehicle?",
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  )),
                      Divider(height: height * 0.04),
                      Text(
                          "Lorem Ipsum Dolor Sit Lorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor SitLorem Ipsum Dolor Sit",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                      Divider(height: height * 0.04),
                      Text("We have a solution for you",
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.bodyText1!.copyWith(
                                    fontSize: 10,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  )),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: height * 0.65,
              child: Container(
                height: height * 0.06,
                width: width * 0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Theme.of(context).primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Spacer(),
                    Text(
                      "Request A Call",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    Spacer(),
                    Container(
                      alignment: Alignment.center,
                      height: height * 0.06,
                      width: width * .15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)),
                          color: Color(0xFFD92B2B)),
                      child: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.09,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: height * 0.025,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              AutoSizeText(
                "My Garage",
                maxFontSize: 16,
                minFontSize: 5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Icon(Icons.notifications_none_outlined,
                  color: Colors.white, size: height * 0.02),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: height * 0.065,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Image.asset(
                  "assets/images/thar.png",
                  scale: 0.8,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.white,
                size: height * 0.025,
              ),
              SizedBox(width: 10),
              AutoSizeText(
                "Patna, Bihar",
                maxLines: 1,
                maxFontSize: 12,
                minFontSize: 5,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(width: 10),
              AutoSizeText(
                "Mahendra Thar (Diesel)",
                maxLines: 1,
                maxFontSize: 12,
                minFontSize: 5,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }
}
