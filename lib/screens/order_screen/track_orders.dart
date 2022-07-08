import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/profile_screen/order_history.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
class TrackOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      CustomAppBar(height: height, width: width),
                      AppBar(
                        backgroundColor: Colors.white,
                        title: Text(
                          "Track Order",
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
                  Center(
                    child: Consts.titleText(
                        text: "Order Number : #20314665521236623"),
                  ),
                  OrderSummary(),
                  Divider(
                    height: height * 0.01,
                    color: Colors.transparent,
                  ),
             
//                 StepProgressIndicator(
//     totalSteps: 6,
//     currentStep: 4,
//     size: 36,
//     selectedColor: Colors.black,
//     unselectedColor: Colors.grey[200],
//     customStep: (index, color, _) => color == Colors.black
//         ? Container(
//             color: color,
//             child: Icon(
//             Icons.check,
//             color: Colors.white,
//             ),
//         )
//         : Container(
//             color: color,
//             child: Icon(
//             Icons.remove,
//             ),
//         ),
// )
                ],
              ),
            ),
          )),
    );
  }
}

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return myContainer(
      width: width,
      child: Column(
        children: [
          CommonDataOrder(),
        ],
      ),
    );
  }
}

class CommonDataOrder extends StatelessWidget {
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
                  text: "Pick Up Date", color: Colors.grey.withOpacity(0.8)),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        ),
        dashLine(),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Consts.titleText2(text: "Price Details", color: Colors.grey),
        ),
        InvoiceRows(),
      ],
    );
  }
}

class InvoiceRows extends StatelessWidget {
  const InvoiceRows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dataRow("Service Total", "Rs 4000"),
        dataRow("Service Name", "Engine Oil"),
        dataRow("Order Id", "#98545546161bff"),
        dataRow(
          "Payment Status",
          "Paid",
          color2: Colors.black,
          fontWeight2: FontWeight.bold,
        ),
        dataRow("Payment Id", "#25155225f1525"),
        Divider(),
        dataRow("Total", "Rs 4000",
            color1: Colors.grey.shade800, fontWeight1: FontWeight.bold),
      ],
    );
  }

  Widget dataRow(String title, String value,
      {Color color1 = Colors.grey,
      Color color2 = Colors.grey,
      FontWeight fontWeight1 = FontWeight.normal,
      fontWeight2 = FontWeight.normal}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(color: color1, fontWeight: fontWeight1),
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              value,
              style: TextStyle(color: color2, fontWeight: fontWeight2),
            ),
          ),
        ],
      ),
    );
  }
}
