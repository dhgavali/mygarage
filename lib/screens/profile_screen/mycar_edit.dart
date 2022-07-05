import 'package:bee/global_widgets/custom_scaffold.dart';
import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/profile_screen/mycar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';

class MyCarEdit extends StatelessWidget {
  final TextEditingController _regNoContro = TextEditingController();
  final TextEditingController _purchaseyear = TextEditingController();
  final TextEditingController _kmContro = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          drawer: MyDrawer(),
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Column(
                      children: [
                        CustomAppBar(height: height, width: width),
                        AppBar(
                          backgroundColor: Colors.white,
                          title: Text(
                            "My Car",
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
                    DirectionButtons(),
                    Divider(
                      height: height * 0.01,
                      color: Colors.transparent,
                    ),
                    CarCard(),
                    Divider(
                      height: height * 0.01,
                      color: Colors.transparent,
                    ),
                    myContainer(
                      width: width * 0.95,
                      customMargin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 5),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _cInputField(
                                    width: width * 0.3,
                                    label: "Reg No :",
                                    context: context,
                                    hint: "",
                                    txController: _regNoContro,
                                    valids: Validators.novalid),
                                _cInputField(
                                    width: width * 0.35,
                                    label: "Purchase Year :",
                                    context: context,
                                    hint: "",
                                    keyboard: TextInputType.number,
                                    txController: _purchaseyear,
                                    valids: Validators.novalid),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _cInputField(
                                    width: width * 0.35,
                                    label: "Kilometer Driven : ",
                                    context: context,
                                    hint: "",
                                    keyboard: TextInputType.number,
                                    txController: _kmContro,
                                    valids: Validators.novalid),
                              ],
                            ),
                            LongButton(
                                width: width * 0.25,
                                height: 40,
                                title: "Save",
                                onpress: () {
                                  Navigator.of(context).maybePop();
                                }),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

Widget _cInputField({
  required String label,
  required BuildContext context,
  required String hint,
  required TextEditingController txController,
  required String? valids(String? value),
  double? width,
  TextInputType keyboard = TextInputType.name,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Consts.titleText(text: label),
      Container(
        width: width ?? MediaQuery.of(context).size.width * 0.8,
        margin: EdgeInsets.symmetric(vertical: 5),
        height: 40,
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
          cursorColor: Colors.black,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),

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
