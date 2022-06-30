import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/screens/cart_screen/edit_address.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/order_screen/payment.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:bee/utils/constants.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../global_widgets/cutom_appbar.dart';

/// page to select services to add inside the cart
class BookingServicesCart extends StatefulWidget {
  @override
  State<BookingServicesCart> createState() => _BookingServicesCartState();
}

class _BookingServicesCartState extends State<BookingServicesCart> {
  bool _isSelected = false;

  List<String> groupList = ["Primary", "secondary", "other"];

  int selectedItem = 0;

  bool _deliveryMode = false;
  @override
  Widget build(BuildContext context) {
    print("booking services");
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: ContinueBtn(onpres: () {
          pushNewScreen(context,
              screen: PaymentPage(),
              pageTransitionAnimation: PageTransitionAnimation.cupertino);
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Colors.white,
        body: Column(
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
            _pickUpLocation(width),
            _deliveryType(width),
            // _addressBox(width, context),
            myContainer(
              width: width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consts.titleText(text: "Select Address"),
                  Container(
                    height: 220,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _addressBox(context, width, true),
                        _addressBox(context, width, _isSelected),
                        _addressBox(context, width, _isSelected),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          minRadius: 12,
                          backgroundColor: Consts().greyColor,
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _addressBox(BuildContext context, double width, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: myContainer(
        width: width * 0.7,
        customPadding: EdgeInsets.all(5),
        child: Column(
          children: [
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              value: groupList,
              groupValue: groupList,
              onChanged: (value) {},
              selected: isSelected,
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor:
                  isSelected ? Consts().primaryColor : Consts().greyColor,
              toggleable: true,
              title: Consts.titleText(
                text: "Ritik Mishra",
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
              child: AutoSizeText(
                  "Sector - 08, Civil Lines Road, NCR, \n120074, Delhi \n \n+91-9876543210",
                  style: Theme.of(context).textTheme.bodyText1),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.delete_outline,
                      )),
                  GestureDetector(
                    onTap: () {
                      pushNewScreen(context, screen: EditAddressCart());
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      color: Consts().primaryColor,
                      child: Text(
                        "Edit",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _pickUpLocation(double width) {
    return myContainer(
      customPadding: EdgeInsets.zero,
      child: ListTile(
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Consts().primaryColor,
        ),
        title: AutoSizeText(
          "Pick Up Location",
          minFontSize: 18,
          maxFontSize: 24,
          style: TextStyle(
            color: Consts().primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Row(children: [
          Icon(
            Icons.location_on,
            color: Consts().primaryColor,
            size: 12,
          ),
          Text(
            "Sector-03 Patna, Bihar",
          ),
        ]),
      ),
      width: width,
      borderColor: Colors.red,
    );
  }

  Widget _deliveryType(double width) {
    return myContainer(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Consts.titleText(
              text: "Delivery Type",
            ),
          ),
          Row(
            children: [
              selectBox(
                title: "Self Deliver",
                isSelected: !_deliveryMode,
              ),
              SizedBox(
                width: 10,
              ),
              selectBox(
                title: "Pick up By Bee Mechanic",
                isSelected: _deliveryMode,
              ),
            ],
          ),
        ],
      ),
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
          _deliveryMode = !_deliveryMode;
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
        padding: EdgeInsets.all(10),
        child: Consts.titleText(
            text: title, color: isSelected ? Colors.white : Consts().greyColor),
      ),
    );
  }
}
