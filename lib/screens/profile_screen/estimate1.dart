import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/profile_screen/estimate2.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class EstimateOne extends StatefulWidget {
  @override
  State<EstimateOne> createState() => _EstimateOneState();
}

class _EstimateOneState extends State<EstimateOne> {
  void getData() {
    // List<InvoiceModel> data = [];
  }

  bool _paymentMode = false;

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
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Consts.titleText2(text: "Payment Mode"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectBox(
                          title: "Online",
                          isSelected: !_paymentMode,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        selectBox(
                          title: "Offline",
                          isSelected: _paymentMode,
                        ),
                      ],
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

  Widget selectBox({
    required String title,
    required bool isSelected,
    double? width,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _paymentMode = !_paymentMode;
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
