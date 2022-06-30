import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/screens/cart_screen/booking_services.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:bee/utils/constants.dart';

import '../../global_widgets/cutom_appbar.dart';

class FilledCart extends StatefulWidget {
  const FilledCart({Key? key}) : super(key: key);

  @override
  State<FilledCart> createState() => _FilledCartState();
}

class _FilledCartState extends State<FilledCart> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(mainAxisSize: MainAxisSize.min, children: [
        CustomAppBar(height: height, width: width),
        Divider(height: height * 0.02, color: Colors.transparent),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: AutoSizeText(
                "Cart",
                maxFontSize: 22,
                minFontSize: 10,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ServiceAddBox(
              width: width,
              height: height,
            ),
            // TODO: package box
            IssueCard(width: width, height: height),
            FreqAddBox(
              width: width,
              height: height,
            ),
            CartPriceTotal(
              width: width,
              height: height,
            ),

            LongButton(
                width: width,
                height: 40,
                title: "Continue",
                onpress: () {
                  pushNewScreen(context,
                      screen: BookingServicesCart(),
                      pageTransitionAnimation:
                          PageTransitionAnimation.cupertino);
                }),
          ],
        ))
      ]),
    ));
  }
}

class FreqAddBox extends StatelessWidget {
  final double width;
  final double height;

  const FreqAddBox({required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return myContainer(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Frequently Added Together",
            minFontSize: 16,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
            maxFontSize: 22,
          ),
          SizedBox(
            height: 4,
          ),
          AutoSizeText(
            "Add more product for extra discount",
            minFontSize: 8,
            maxFontSize: 22,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontWeight: FontWeight.w300),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FATProductRow(
                width: width,
                height: height,
              ),
              FATProductRow(
                width: width,
                height: height,
              ),
              FATProductRow(
                width: width,
                height: height,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FATProductRow extends StatelessWidget {
  final double width;
  final double height;

  const FATProductRow({required this.width, required this.height});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.26,
      margin: EdgeInsets.symmetric(horizontal: 5),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Consts().border_color),
        shape: BoxShape.rectangle,
      ),
      child: LimitedBox(
        maxWidth: width * 0.26,
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.contain,
                        child: AutoSizeText(
                          "Lorem Ipsum",
                          minFontSize: 18,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                          maxFontSize: 22,
                        ),
                      ),
                      FittedBox(
                        child: AutoSizeText(
                          "Lorem Ipsum",
                          minFontSize: 8,
                          maxFontSize: 22,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2!
                              .copyWith(fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                  AutoSizeText(
                    "Rs 899",
                    minFontSize: 10,
                    maxFontSize: 22,
                    style: Consts().redText,
                  ),
                ],
              ),
            ),
            //
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //img,
                  Container(
                    child: Image(
                      image: AssetImage(
                        "assets/images/part1.png",
                      ),
                    ),
                  ),
                  //add button
                  SizedBox(
                    height: 10,
                  ),
                  FittedBox(child: add_box()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget add_box() {
    return Container(
      // child: ElevatedButton.icon(
      //   icon: Icon(Icons.add),
      //   label: Text("Add"),
      //   onPressed: () {},
      // ),

      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: EdgeInsets.all(5),
      child: Row(children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          child: FittedBox(
            child: Icon(
              Icons.add,
              size: 12,
              color: Colors.red,
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),
        AutoSizeText(
          "Add",
          minFontSize: 10,
          maxFontSize: 22,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ]),
    );
  }
}

class CartPriceTotal extends StatelessWidget {
  final double width;
  final double height;

  const CartPriceTotal({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return myContainer(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "Price Details",
            minFontSize: 16,
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
            maxFontSize: 22,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  "Serive Total",
                  minFontSize: 14,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxFontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  "Rs 4000",
                  minFontSize: 14,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxFontSize: 22,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  "Order Total",
                  minFontSize: 14,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxFontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  "Rs 4000",
                  minFontSize: 14,
                  style: Theme.of(context).textTheme.bodyText1,
                  maxFontSize: 22,
                ),
              ),
            ],
          ),
          Divider(
            color: Color(0xff999999),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  "Total",
                  minFontSize: 16,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  maxFontSize: 22,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: AutoSizeText(
                  "Rs 4000",
                  minFontSize: 16,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                  maxFontSize: 22,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
