import 'package:auto_size_text/auto_size_text.dart';

import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/order_screen/widgets.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';

import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';

class OrderConfirm extends StatefulWidget {
  @override
  State<OrderConfirm> createState() => OrderConfirmState();
}

class OrderConfirmState extends State<OrderConfirm> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(height: height, width: width),
              AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Cart",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
                leading: MyBackButton(),
              ),
              Divider(height: height * 0.01, color: Colors.transparent),
              Container(
                width: width,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: Consts.titleText(
                    text: "Waiting for confirmation of your order"),
              ),
              Divider(height: height * 0.05, color: Colors.transparent),
              CartPriceTotal(width: width, height: height),
              OrderStepper(),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Consts.titleText2(text: "If Any Issues"),
              ),
              CallUsButton(width: width * 0.6, height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderStepper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40),
      width: width,
      height: width * 0.75,
      child: Center(
        child: Stack(
          children: [
            Positioned(
              top: 25,
              left: 30,
              child: Container(
                width: 8,
                color: Colors.grey.shade200,
                height: width * 0.5,
              ),
            ),
            Positioned(
              top: 10,
              width: width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  StatusDot(
                    isActive: true,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  StatusInfo(
                    title: "Order Placed",
                    subtitle: "22 Jun 2021, 02:00 PM",
                    subtitleColor: Colors.black,
                    isSubtitle: true,
                  ),
                ],
              ),
            ),
            Positioned(
              top: width * 0.25,
              width: width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  StatusDot(
                    isActive: false,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  StatusInfo(
                    title: "Waiting For Confirmation From \nGarage Side",
                    subtitle: "",
                  ),
                ],
              ),
            ),
            Positioned(
              top: width * 0.50,
              width: width,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  StatusDot(
                    isActive: false,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  StatusInfo(
                    title: "Our mechanic out for pick up \nyour vehicle.",
                    subtitle: "Arriving in 20 min.",
                    subtitleColor: Colors.black,
                    isSubtitle: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatusDot extends StatelessWidget {
  final bool isActive;

  const StatusDot({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.red : Colors.white,
          boxShadow: [
            BoxShadow(
              spreadRadius: 3,
              blurRadius: 3,
              color: Colors.grey.shade200,
            ),
          ]),
      child: isActive
          ? Icon(
              Icons.done,
              color: Colors.white,
            )
          : Icon(
              Icons.hourglass_top,
              color: Colors.grey,
            ),
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
      width: width * 0.95,
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
          _detailRow(
              context: context, title1: "Service Total", title2: "Rs. 4000"),
          _detailRow(
              context: context, title1: "Service Name", title2: "Engine Oil"),
          _detailRow(
              context: context, title1: "Order Id", title2: "#98545546161bff"),
          _detailRow(
            context: context,
            title1: "Payment Status",
            title2: "Paid",
            isbold: true,
          ),
          _detailRow(
              context: context, title1: "Payment Id", title2: "#25155225f1525"),
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

  Widget _detailRow({
    required BuildContext context,
    required String title1,
    required String title2,
    bool isbold = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: AutoSizeText(
            title1,
            minFontSize: 14,
            style: Theme.of(context).textTheme.bodyText1,
            maxFontSize: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: AutoSizeText(
            title2,
            minFontSize: 14,
            style: isbold
                ? TextStyle(color: Colors.black, fontWeight: FontWeight.bold)
                : Theme.of(context).textTheme.bodyText1,
            maxFontSize: 22,
          ),
        ),
      ],
    );
  }
}
