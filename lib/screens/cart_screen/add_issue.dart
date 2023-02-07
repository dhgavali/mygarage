import 'package:bee/global_widgets/search_bar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';

import '../../global_widgets/cutom_appbar.dart';

/// page to select services to add inside the cart
class PopIssue extends StatelessWidget {
 final TextEditingController _issueContro = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                "Popular Issues",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
              centerTitle: true,
              elevation: 0.0,
              leading: MyBackButton(),
            ),
            Divider(height: height * 0.01, color: Colors.transparent),
            SearchBar(
              height: height,
              width: width,
              hint: "Search services & Garage",
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: ((context, index) {
                    return RadioListTile(
                        value: "Lorem Ipsum Dolor Sit",
                        groupValue: "",
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 16,
                        ),
                        controlAffinity: ListTileControlAffinity.trailing,
                        title: Text("Lorem Ipsum Dolor Sit"),
                        onChanged: (dynamic) {});
                  })),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: cInputField(
                label: "Other Issue",
                context: context,
                hint: "Enter your issue here",
                txController: _issueContro,
                valids: Validators.novalid,
              ),
            ),
            LongButton(
              width: width,
              height: 40,
              title: "Done",
              onpress: () {
                //TODO: issue screen
                //  pushNewScreen(context,
                //                 screen: FilledCart(),
                //                 pageTransitionAnimation:
                //                     PageTransitionAnimation.cupertino);

                Navigator.of(context).maybePop();
              },
              bgColor: Color(0xff999999),
            ),
          ],
        ),
      ),
    );
  }
}
