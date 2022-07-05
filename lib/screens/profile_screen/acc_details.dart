import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatefulWidget {
  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  TextEditingController _nameContro = TextEditingController();
  TextEditingController _phoneContro = TextEditingController();
  TextEditingController _emailContro = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Container(
            child: Column(
              children: [
                Column(
                  children: [
                    CustomAppBar(height: height, width: width),
                    SizedBox(
                      height: 5,
                    ),
                    profileBanner(
                      width: width,
                      height: height,
                    ),
                    Divider(height: height * 0.05, color: Colors.transparent),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: width,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          cInputField(
                            label: "Full Name",
                            context: context,
                            hint: "Shubham Verma",
                            txController: _nameContro,
                            valids: Validators.novalid,
                          ),
                          cInputField(
                            label: "Phone Number",
                            context: context,
                            hint: "+91-8984585125",
                            txController: _phoneContro,
                            keyboard: TextInputType.phone,
                            valids: Validators.mobValid,
                          ),
                          cInputField(
                            label: "Email Id",
                            context: context,
                            hint: "abc@gmail.com",
                            txController: _emailContro,
                            keyboard: TextInputType.emailAddress,
                            valids: Validators.emailValid,
                          ),
                          Divider(
                              height: height * 0.05, color: Colors.transparent),
                          LongButton(
                              width: width * 0.9,
                              height: 40,
                              title: "Update",
                              onpress: () {
                                Navigator.of(context).maybePop();
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget profileBanner({
    required double width,
    required double height,
  }) {
    return Container(
      width: width,
      height: height * 0.25,
      decoration: BoxDecoration(
        color: Colors.yellow.shade200,
        gradient: LinearGradient(
            colors: [Colors.red, Colors.white],
            begin: FractionalOffset.bottomLeft,
            end: FractionalOffset.topRight,
            stops: [0.5, 0]),
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "Account Details",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600,
              ),
            ),
            centerTitle: true,
            elevation: 0.0,
            leading: MyBackButton(),
          ),
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 5,
              ),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: CircleAvatar(
              maxRadius: 25,
              minRadius: 20,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Consts.titleText(text: "Shubham Verma"),
          ),
          Container(
            child: Consts.titleText2(text: "+91-9876543210"),
          ),
        ],
      ),
    );
  }
}
