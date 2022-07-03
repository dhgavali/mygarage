import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:flutter/material.dart';

class Faq extends StatefulWidget {
  const Faq({Key? key}) : super(key: key);

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  List<Map<String, dynamic>> _items = List.generate(
      6,
      (index) => {
            'id': index,
            'title': 'Lorem Ipsum Dolor Sit?',
            'description':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut ',
            'isExpanded': false
          });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(children: [
            Column(
              children: [
                CustomAppBar(height: height, width: width),
                AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    "FAQs Regarding Service",
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
            SearchBar(
              height: height,
              width: width,
              hint: "Search your question",
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
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
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 30),
                            child: Text(
                              item['title'],
                              style: TextStyle(fontSize: 20),
                            )),
                        body: Container(
                          // margin: EdgeInsets.symmetric(vertical: 10),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          child: Text(item['description']),
                        ),
                        isExpanded: item['isExpanded'],
                      ),
                    )
                    .toList(),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
