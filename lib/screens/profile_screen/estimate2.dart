import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class EstimateTwo extends StatelessWidget {
  void getData() {
    // List<InvoiceModel> data = [];
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Column(
                children: [
                  CustomAppBar(height: height, width: width),
                  AppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      "Estimate of Vehicle",
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
                height: height * 0.05,
                color: Colors.transparent,
              ),
              myContainer(
                width: width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Center(
                      child: Consts.titleText(text: "Invoice"),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: AutoSizeText(
                          "22/02/2022",
                          maxFontSize: 10,
                          minFontSize: 8,
                        ),
                      ),
                    ),
                    Divider(),
                    InvoiceRows(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Consts.titleText2(text: "Payment Mode:"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Offline",
                            style: Consts().redText,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: height * 0.01,
                      color: Colors.transparent,
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("invoice"),
                            content: InvoiceRows(),
                          ),
                        );
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          "View Invoice",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}

class InvoiceRows extends StatelessWidget {
  const InvoiceRows({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dataRow("Customer Name", "Shubham Mishra"),
        dataRow("Vehicle", "Mahendra Thar (Diesel)"),
        dataRow("Technician Name", "Kartik Mishra"),
        dataRow("Garage Name", "Car Bajaar"),
        dataRow("Service", "Engine oil"),
        dataRow("Service Cost", "Rs 599.00"),
        Divider(),
        dataRow("Total", "Rs 599.00"),
      ],
    );
  }

  Widget dataRow(String title, String value) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Consts.titleText2(text: title),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: Consts.titleText2(text: value),
          ),
        ],
      ),
    );
  }
}
