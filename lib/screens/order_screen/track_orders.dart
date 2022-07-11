import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/menu_pages/faq.dart';
import 'package:bee/screens/order_screen/widgets.dart';
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
                  TrackingWid(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24),
                    alignment: Alignment.topLeft,
                    child: Consts.titleText(
                      text: "FAQs Regarding Services",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GenFAQ(),
                ],
              ),
            ),
          )),
    );
  }
}

class GenFAQ extends StatefulWidget {
  @override
  State<GenFAQ> createState() => _GenFAQState();
}

class _GenFAQState extends State<GenFAQ> {
  List<Map<String, dynamic>> _items = List.generate(
      3,
      (index) => {
            'id': index,
            'title': 'Lorem Ipsum Dolor Sit?',
            'description':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ',
            'isExpanded': false
          });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (index, isExpanded) {
            setState(() {
              _items[index]['isExpanded'] = !isExpanded;
            });
          },
          children: _items
              .map(
                (item) => ExpansionPanel(
                  canTapOnHeader: true,
                  backgroundColor: item['isExpanded'] == true
                      ? Colors.grey.shade200
                      : Colors.white,
                  headerBuilder: (_, isExpanded) => Container(
                      // margin: EdgeInsets.symmetric(vertical: 10),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      child: Text(
                        item['title'],
                        style: TextStyle(fontSize: 18),
                      )),
                  body: Container(
                    // margin: EdgeInsets.symmetric(vertical: 10),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    child: Text(item['description']),
                  ),
                  isExpanded: item['isExpanded'],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class OrderSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

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

class TrackingWid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: width * 0.7,
      height: width * 1.2,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            top: 10,
            child: Container(
              width: 8,
              height: width,
              color: Colors.grey.shade300,
            ),
          ),
          Positioned(
              top: 10,
              left: 0,
              width: width,
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.,
                children: [
                  RedDot(
                    isActive: true,
                  ),
                  SizedBox(width: 20),
                  StatusInfo(
                    title: "Order Placed",
                    subtitle: "22 Jun 2021, 02:00 PM",
                    isSubtitle: true,
                  ),
                ],
              )),
          Positioned(
              top: width * 0.25,
              left: 0,
              width: width,
              child: Row(
                children: [
                  RedDot(),
                  SizedBox(width: 20),
                  StatusInfo(
                    title: "At Workshop",
                    subtitle: "",
                  ),
                ],
              )),
          Positioned(
              top: width * 0.5,
              left: 0,
              width: width,
              child: Row(
                children: [
                  RedDot(),
                  SizedBox(width: 20),
                  StatusInfo(
                    title: "Inspection Mode",
                    subtitle: "",
                  ),
                ],
              )),
          Positioned(
              top: width * 0.75,
              left: 0,
              width: width,
              child: Row(
                children: [
                  RedDot(),
                  SizedBox(width: 20),
                  StatusInfo(
                    title: "Working",
                    subtitle: "",
                  ),
                ],
              )),
          Positioned(
              top: width,
              left: 0,
              width: width,
              child: Row(
                children: [
                  RedDot(),
                  SizedBox(width: 20),
                  StatusInfo(
                    title: "Your Vehicle Ready For Drive!",
                    subtitle: "",
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class RedDot extends StatelessWidget {
  final bool isActive;
  RedDot({this.isActive = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.red : Colors.grey.shade400,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade400,
          ),
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 10,
            color: Colors.grey.shade400,
          ),
        ],
      ),
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
            color: isActive ? Colors.red : Colors.grey.shade400,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
