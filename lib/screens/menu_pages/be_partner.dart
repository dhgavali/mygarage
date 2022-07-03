import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';

class BePartner extends StatefulWidget {
  @override
  State<BePartner> createState() => _BePartnerState();
}

class _BePartnerState extends State<BePartner> {
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _workshopNameContro = TextEditingController();
  final TextEditingController _workshopIdContro = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      drawer: MyDrawer(),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            child: Column(children: [
              Column(
                children: [
                  CustomAppBar(height: height, width: width),
                  AppBar(
                    backgroundColor: Colors.white,
                    title: Text(
                      "Become Our Partner",
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
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                alignment: Alignment.topLeft,
                child: Consts.titleText(
                    text: "Documents required at the time of verification"),
              ),
              MyBulletList(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              MyBulletList(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              MyBulletList(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              MyBulletList(
                  text:
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam"),
              Divider(
                height: height * 0.01,
                color: Colors.transparent,
              ),
              cInputField(
                label: "Full Name",
                context: context,
                hint: "",
                txController: _nameController,
                valids: Validators.novalid,
              ),
              cInputField(
                label: "Mobile Number",
                context: context,
                hint: "",
                txController: _mobController,
                valids: Validators.mobValid,
              ),
              cInputField(
                label: "Email Id",
                context: context,
                hint: "",
                txController: _emailController,
                valids: Validators.emailValid,
              ),
              cInputField(
                label: "Workshop Name",
                context: context,
                hint: "",
                txController: _workshopNameContro,
                valids: Validators.novalid,
              ),
              cInputField(
                label: "Workshop Registration Number ( if any )",
                context: context,
                hint: "",
                txController: _workshopIdContro,
                valids: Validators.novalid,
              ),
              cInputField(
                label: "City",
                context: context,
                hint: "",
                txController: _cityController,
                valids: Validators.novalid,
              ),
              LongButton(
                  width: width * 0.85,
                  height: 40,
                  title: "Submit",
                  onpress: () {
                    Navigator.of(context).maybePop();
                  }),
              Divider(
                height: height * 0.025,
                color: Colors.transparent,
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}

class MyBulletList extends StatelessWidget {
  final String text;
  final double vpad;
  final double hpad;

  MyBulletList({
    required this.text,
    this.hpad = 24.0,
    this.vpad = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hpad, vertical: vpad),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 6,
            color: Colors.grey,
          ),
          SizedBox(
            width: 5,
          ),
          AutoSizeText(
            text,
            minFontSize: 8,
            maxFontSize: 12,
          )
        ],
      ),
    );
  }
}
