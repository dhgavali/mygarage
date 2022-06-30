import 'package:bee/screens/order_screen/order_confirm.dart';
import 'package:bee/screens/order_screen/widgets.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
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
                child: Consts.titleText(text: "Order Confirm Form Client Side"),
              ),
              Divider(height: height * 0.05, color: Colors.transparent),
              CartPriceTotal(width: width, height: height),
              Container(
                alignment: Alignment.center,
                height: width * 0.3,
                child: Text("Order stepper"),
              ),
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
