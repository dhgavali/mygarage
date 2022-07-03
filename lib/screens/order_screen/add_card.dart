import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';

import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';

class AddDebitCard extends StatefulWidget {
  @override
  State<AddDebitCard> createState() => AddDebitCardState();
}

class AddDebitCardState extends State<AddDebitCard> {
  TextEditingController _cardNoContro = TextEditingController();
  TextEditingController _expiryContro = TextEditingController();
  TextEditingController _cvvContro = TextEditingController();
  TextEditingController _nameContro = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomAppBar(height: height, width: width),
              AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  "Add Card",
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
              myContainer(
                width: width,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _cInputField(
                        width: width,
                        valids: Validators.novalid,
                        txController: _cardNoContro,
                        hint: "1231 - 2312 - 3123 - 1231",
                        context: context,
                        keyboard: TextInputType.number,
                        mxlen: 19,
                        label: "Card Number",
                        onchange: (value) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _cInputField(
                            width: width * 0.45,
                            valids: Validators.novalid,
                            txController: _expiryContro,
                            hint: "12/12",
                            context: context,
                            label: "Expiration Date",
                            mxlen: 5,
                            keyboard: TextInputType.number,
                            onchange: (value) {
                              // if (value.length == 2 && !value.contains("/")) {
                              //   _expiryContro.text += "/";
                              //   _expiryContro.selection =
                              //       TextSelection.fromPosition(TextPosition(
                              //           offset: _expiryContro.text.length));
                              // }
                            },
                          ),
                          _cInputField(
                            width: width * 0.45,
                            valids: Validators.novalid,
                            txController: _cvvContro,
                            hint: "1219",
                            keyboard: TextInputType.number,
                            context: context,
                            mxlen: 4,
                            label: "Security Code",
                            onchange: (value) {},
                          ),
                        ],
                      ),
                      _cInputField(
                        width: width,
                        valids: Validators.novalid,
                        txController: _nameContro,
                        hint: "Riya Mishra",
                        context: context,
                        mxlen: 4,
                        label: "Card Holder",
                        onchange: (value) {},
                      ),
                      LongButton(
                          width: width,
                          height: 40,
                          title: "Add Card",
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
    );
  }

  Widget _cInputField({
    required String label,
    required BuildContext context,
    required String hint,
    required double width,
    required TextEditingController txController,
    int mxlen = 40,
    required String? valids(String? value),
    required Function(String) onchange,
    TextInputType keyboard = TextInputType.name,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Consts.titleText(text: label),
        Container(
          width: width * 0.8,
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
            maxLength: mxlen,
            onChanged: onchange,
            controller: txController,
            cursorColor: Colors.grey,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),
              counterText: "",
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
