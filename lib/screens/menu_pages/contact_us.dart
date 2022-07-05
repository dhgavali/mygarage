import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatefulWidget {
  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

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
                      "Contact Us",
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
              ContactBox(),
              SizedBox(height: 10),
              Container(
                width: width * .95,
                height: height * 0.2,
                color: Colors.grey,
                child: Center(
                    child: Text(
                  "MAP View",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )),
              ),
              SizedBox(height: 20),
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
              messageField(
                label: "Message",
                context: context,
                hint: "",
                txController: _messageController,
                valids: Validators.novalid,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).maybePop();
                },
                child: myContainer(
                  boxColor: Colors.white,
                  child: Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Text(
                        "Send Message",
                        style: Consts().redText,
                      )),
                  width: width * 0.4,
                  borderColor: Colors.red,
                ),
              )
            ]),
          ),
        ),
      ),
    ));
  }

  Widget messageField({
    required String label,
    required BuildContext context,
    required String hint,
    required TextEditingController txController,
    required String? valids(String? value),
    TextInputType keyboard = TextInputType.name,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consts.titleText(text: label),
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Consts().greyColor.withOpacity(0.2),
            ),
          ),
          child: TextFormField(
            validator: valids,
            keyboardType: keyboard,
            controller: txController,
            maxLines: 8,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),

              // fillColor: Constant.kprimary,
              border: OutlineInputBorder(),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: (Colors.white), width: 2.0),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
              ),

              hintText: hint,
              hintStyle: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 16,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class ContactBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return myContainer(
      customPadding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 10,
      ),
      width: width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _dataBox(
              width: width,
              title: "Phone",
              icon: Icons.phone_in_talk_outlined,
              subtitle: "+91-222304020"),
          _dataBox(
              width: width,
              title: "Address",
              icon: Icons.location_on_outlined,
              subtitle: "60-49 Road 11378 NCR"),
          _dataBox(
              width: width,
              title: "Open Time",
              icon: Icons.access_time,
              subtitle: "10:00 am to 23:00 pm"),
          _dataBox(
            width: width,
            title: "Email",
            icon: Icons.email_outlined,
            subtitle: "hello@colorlib.com",
          ),
        ],
      ),
    );
  }

  Widget _dataBox({
    required IconData icon,
    required String title,
    required String subtitle,
    required double width,
  }) {
    return Container(
      width: width * 0.2,
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          SizedBox(
            height: 10,
          ),
          Consts.titleText2(text: title),
          SizedBox(
            height: 5,
          ),
          FittedBox(
            child: AutoSizeText(
              subtitle,
              maxFontSize: 12,
              minFontSize: 6,
            ),
          ),
        ],
      ),
    );
  }
}
