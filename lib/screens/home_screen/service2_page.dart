import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/cart_screen/filled_cart.dart';
import 'package:bee/screens/home_screen/widgets.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../global_widgets/cutom_appbar.dart';
import 'home_page.dart';

/// page to select services to add inside the cart
class ServiceTwoPage extends StatelessWidget {
  const ServiceTwoPage({Key? key}) : super(key: key);

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
            Divider(height: height * 0.02, color: Colors.transparent),
            SelectionList(height: height, width: width),
            Divider(height: height * 0.02, color: Colors.transparent),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: AutoSizeText(
                          "Select Services",
                          maxFontSize: 22,
                          minFontSize: 10,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      MostPopular(
                        height: height,
                        width: width,
                        onpress: () {},
                      ),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      MostPopular(
                        height: height,
                        width: width,
                        onpress: () {},
                      ),
                      Divider(height: height * 0.01, color: Colors.transparent),
                      MostPopular(
                        height: height,
                        width: width,
                        onpress: () {},
                      ),
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

class StatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 49,
      height: 49,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey.shade100,
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Icon(
          Icons.access_time,
          color: Colors.grey,
          size: 16,
        ),
        Wrap(
          direction: Axis.horizontal,
          children: [
            AutoSizeText(
              "3 Hrs \n Taken",
              maxFontSize: 10,
              minFontSize: 6,
            ),
          ],
        ),
      ]),
    );
  }
}

class MostPopular extends StatelessWidget {
  const MostPopular({
    Key? key,
    required this.height,
    required this.width,
    required this.onpress,
  }) : super(key: key);
  final Function onpress;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: GestureDetector(
        onTap: () {
          pushNewScreen(context,
              screen: FilledCart(),
              pageTransitionAnimation: PageTransitionAnimation.cupertino);
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          height: height * 0.22,
          width: width,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topCenter,
                width: width * 0.35,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/service.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: 20,
                  alignment: Alignment.center,
                  color: Theme.of(context).primaryColor,
                  child: AutoSizeText(
                    "Most Popular",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                width: width * 0.5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            AutoSizeText(
                              "Complete Car Service",
                              maxFontSize: 22,
                              minFontSize: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black),
                            ),
                            AutoSizeText(
                              "Rs 699",
                              maxFontSize: 22,
                              minFontSize: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Theme.of(context).primaryColor),
                            ),
                            AutoSizeText(
                              "Save upto Rs 299",
                              maxFontSize: 12,
                              minFontSize: 10,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.green),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            StatusWidget(),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 3),
                              color: Colors.grey,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 14,
                                    color: Colors.white,
                                  ),
                                  Consts.titleText3(
                                    text: "Add",
                                    color: Colors.white,
                                    minfsize: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    dashLine(),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        featureName(),
                        featureName(),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        featureName(),
                        featureName(),
                      ],
                    ),
                    Center(
                      child: TextButton(
                        style: ButtonStyle(
                          splashFactory:
                              InkSparkle.constantTurbulenceSeedSplashFactory,
                          // surfaceTintColor: MaterialStateProperty.all(Colors.red),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize:
                              MaterialStateProperty.all(const Size(0, 5)),
                        ),
                        child: Text(
                          "+3 more View all",
                          style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SelectionList extends StatefulWidget {
  const SelectionList({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;
  static const List<String> items = [
    'Periodic Services',
    'Body Repair',
    'Battries',
    'Custom Services',
    'Engine Repair'
  ];

  @override
  State<SelectionList> createState() => _SelectionListState();
}

class _SelectionListState extends State<SelectionList> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: widget.height * 0.035, maxWidth: widget.width * 0.95),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (c, _) => SizedBox(width: 10),
        itemCount: SelectionList.items.length,
        itemBuilder: (ctx, indx) => GestureDetector(
          onTap: () => setState(() {
            selected = indx;
          }),
          child: Container(
            padding: const EdgeInsets.all(5),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: selected == indx ? Colors.red : Colors.transparent,
                borderRadius: BorderRadius.circular(5)),
            child: AutoSizeText(
              SelectionList.items[indx],
              maxFontSize: 14,
              maxLines: 1,
              minFontSize: 5,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: selected == indx ? Colors.white : Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
