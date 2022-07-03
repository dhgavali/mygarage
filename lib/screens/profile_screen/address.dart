import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/edit_address.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ProfileAddress extends StatefulWidget {
  @override
  State<ProfileAddress> createState() => _ProfileAddressState();
}

class _ProfileAddressState extends State<ProfileAddress> {
  String radiovalue = "home";
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(height: height, width: width),
              AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600,
                  ),
                ),
                centerTitle: true,
                elevation: 0.0,
                leading: MyBackButton(),
              ),
              Divider(
                height: height * 0.01,
                color: Colors.transparent,
              ),
              myContainer(
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Consts.titleText3(minfsize: 12, text: "Select Address"),
                    Container(
                      height: 210,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _addressBox(context, width, "home"),
                          _addressBox(context, width, "primary"),
                          _addressBox(context, width, "other"),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            minRadius: 10,
                            backgroundColor: Consts().greyColor,
                            child: Icon(
                              Icons.add,
                              size: 12,
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
          )),
    );
  }

  Widget _addressBox(BuildContext context, double width, String cvalue) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: myContainer(
        width: width * 0.7,
        customPadding: EdgeInsets.all(5),
        child: Column(
          children: [
            RadioListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
              value: cvalue,
              groupValue: radiovalue,
              onChanged: (value) {
                setState(() {
                  radiovalue = cvalue;
                });
              },
              // selected: isSelected,
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: Consts().primaryColor,
              toggleable: true,
              title: Consts.titleText3(
                minfsize: Consts.stitle2,
                text: "Ritik Mishra",
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding:
                  const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
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
}
