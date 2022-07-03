import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/global_widgets/search_bar.dart';
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
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: Table(
                children: [
                  rowHeader(),
                  datarow(),
                  datarow(),
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
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        children: [
          rowTitle(),
          rowTitle(),
          rowTitle(),
          rowTitle(),
        ]);
  }

  Widget rowTitle() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        "Hello",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  TableRow datarow() {
    return TableRow(
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(30),
        ),
        children: [
          Flexible(child: datacell("1")),
          Flexible(child: datacell("Lorem Ipsum")),
          Flexible(child: datacell("Lorem Ipsum")),
          Flexible(child: datacell("+91-9832321245")),
        ]);
  }

  Widget datacell(String data) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Text(
        data,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
