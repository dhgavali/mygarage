import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PartnerList extends StatefulWidget {
  const PartnerList({Key? key}) : super(key: key);

  @override
  State<PartnerList> createState() => _PartnerListState();
}

class _PartnerListState extends State<PartnerList> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.red,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          "Load More",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: MyDrawer(),
      body: SingleChildScrollView(
          child: Column(
        children: [
          CustomAppBar(height: height, width: width),
          AppBar(
            backgroundColor: Colors.white,
            title: Text(
              "Our Partners ",
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
          SearchBar(
            height: height,
            width: width,
            hint: "Search Partner",
          ),
          Divider(
            height: height * 0.01,
            color: Colors.transparent,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: Table(
                columnWidths: {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(2),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                },
                children: [
                  rowHeader(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                  datarow(),
                  spaceRow(),
                ],
              ),
            ),
          ),
        ],
      )),
    ));
  }

  TableRow rowHeader() {
    return TableRow(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(30),
        ),
        children: [
          rowTitle("Sr. No"),
          rowTitle("Workshop Name"),
          rowTitle("Address"),
          rowTitle("Contact No."),
        ]);
  }

  Widget rowTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  TableRow datarow() {
    return TableRow(
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(0),
        ),
        children: [
          Flexible(child: datacell("1")),
          Flexible(child: datacell("Lorem Ipsum")),
          Flexible(child: datacell("Lorem Ipsum")),
          Flexible(child: datacell("+91-9832321245")),
        ]);
  }

  TableRow spaceRow() {
    return TableRow(
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(30),
        ),
        children: [
          Container(height: 5, color: Colors.white),
          Container(height: 5, color: Colors.white),
          Container(height: 5, color: Colors.white),
          Container(height: 5, color: Colors.white),
        ]);
  }

  Widget datacell(String data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Text(
        data,
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}
