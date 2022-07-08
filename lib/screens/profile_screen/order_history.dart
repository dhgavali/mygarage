import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/order_screen/track_orders.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class OrderHistory extends StatefulWidget {
  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  bool _orderType = false;

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();
  int _rating = 3;

  @override
  Widget build(BuildContext context) {
    print(_orderType);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          key: scaffoldkey,
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          body: Container(
            height: height * 0.8,
            child: Column(
              children: [
                Column(
                  children: [
                    CustomAppBar(height: height, width: width),
                    AppBar(
                      backgroundColor: Colors.white,
                      title: Text(
                        "Order History",
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    selectBox(
                      title: "Processing",
                      isSelected: !_orderType,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    selectBox(
                      title: "Completed",
                      isSelected: _orderType,
                    ),
                  ],
                ),
                _orderType ? HorderComplete() : HorderProcess(),
                _orderType
                    ? GestureDetector(
                        onTap: () {
                          scaffoldkey.currentState!.showBottomSheet((context) =>
                              BottomSheet(
                                  enableDrag: false,
                                  onClosing: () {},
                                  builder: (context) => feedbackWindow()));
                        },
                        child: myContainer(
                            child: Container(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.rate_review_outlined,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "Feedback",
                                  style: Consts().redText,
                                )
                              ],
                            )),
                            borderColor: Colors.red,
                            width: width),
                      )
                    : LongButton(
                        width: width,
                        height: 40,
                        title: "Track Order",
                        onpress: () {
                          pushNewScreen(
                            context,
                            screen: TrackOrders(),
                          );
                        },
                      ),
              ],
            ),
          )),
    );
  }

  Widget selectBox({
    required String title,
    required bool isSelected,
    double? width,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _orderType = !_orderType;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Consts().primaryColor : Colors.white,
          border: Border.all(
            color: isSelected
                ? Consts().primaryColor
                : Consts().greyColor.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Consts.titleText3(
            minfsize: 12,
            text: title,
            color: isSelected ? Colors.white : Consts().greyColor),
      ),
    );
  }
}

class HorderComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return myContainer(
      width: width,
      child: Column(
        children: [
          CommonDataOrder(
            statusWidget: Column(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                    border: Border.all(color: Colors.grey, width: 4),
                  ),
                  child: Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Consts.titleText2(text: "Completed"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CommonDataOrder extends StatelessWidget {
  final Widget statusWidget;

  const CommonDataOrder({required this.statusWidget});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        OrderHeader(),
        Divider(height: height * 0.01, color: Colors.transparent),
        dashLine(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Consts.titleText(
                  text: "Price", color: Colors.grey.withOpacity(0.8)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Consts.titleText(
                  text: "Booking ID", color: Colors.grey.withOpacity(0.8)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    "Rs 999",
                    minFontSize: 10, maxFontSize: 14,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                    // style: Consts.greyFont(14),
                  ),
                  AutoSizeText(
                    "Rear Bumper",
                    minFontSize: 10, maxFontSize: 12,

                    // style: Consts.greyFont(14),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: AutoSizeText(
                "#2544855865586",
                style: Consts.greyFont(14),
              ),
            ),
          ],
        ),
        dashLine(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Consts.titleText(
                  text: "Slot Selected", color: Colors.grey.withOpacity(0.8)),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Consts.titleText(
                  text: "Status", color: Colors.grey.withOpacity(0.8)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        color: Color(0xff305088),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AutoSizeText("02:00 PM"),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_month,
                        color: Color(0xff305088),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      AutoSizeText("22 JUN 2021"),
                    ],
                  ),
                ],
              ),
              statusWidget,
            ],
          ),
        ),
      ],
    );
  }
}

class HorderProcess extends StatelessWidget {
  const HorderProcess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return myContainer(
      width: width,
      child: Column(children: [
        CommonDataOrder(
          statusWidget: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey, width: 4),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Icon(
                Icons.access_time,
                color: Colors.grey,
                size: 16,
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  AutoSizeText(
                    "3 Hrs \n Left",
                    maxFontSize: 10,
                    minFontSize: 6,
                  ),
                ],
              ),
            ]),
          ),
        ),
      ]),
    );
  }
}

class feedbackWindow extends StatelessWidget {
  const feedbackWindow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      alignment: Alignment.center,
      width: width,
      height: height * 0.5,
      child: Container(
        width: width * 0.95,
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: height * 0.5,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2.0,
            blurRadius: 2.0,
          )
        ]),
        child: Column(children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: AutoSizeText(
              "Write Review!",
              minFontSize: 20,
              maxFontSize: 24,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Consts.titleText2(
                text:
                    "Please write Overall level of satisfaction \nwith your Service"),
          ),
          Center(
            child: RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: false,
              tapOnlyMode: true,
              itemCount: 5,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.red,
              ),
              onRatingUpdate: (rating) {
                print("changed");
                print(rating);
                // this._rating = rating.toInt();
                // ValueNotifier(_rating).value =
                //     rating.toInt();
              },
            ),
          ),
          Container(
              width: width * 0.8,
              padding: EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.topLeft,
              child: Consts.titleText(text: "Write your reviews: ")),
          Container(
            width: width * 0.8,
            padding: EdgeInsets.symmetric(horizontal: 20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.2),
              ),
            ),
            child: TextFormField(
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Write your review here",
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                border: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).maybePop();
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(5),
              ),
              child: AutoSizeText(
                "Submit",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                minFontSize: 14,
                maxFontSize: 14,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class OrderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage("assets/images/thar.png"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consts.titleText(text: "Mahendra Thar"),
                    Text(
                      "Diesel",
                      style: Consts.greyBold(12),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            child: AutoSizeText(
              "02-06-2021",
              minFontSize: 8,
              maxFontSize: 12,
              style: TextStyle(),
            ),
          ),
        ],
      ),
    );
  }
}
