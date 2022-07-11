import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/widgets.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:bee/global_widgets/custom_scaffold.dart';

class EditAddressCart extends StatefulWidget {
  @override
  State<EditAddressCart> createState() => EditAddressCartState();
}

class EditAddressCartState extends State<EditAddressCart> {
  String _selectedState = "Andhra Pradesh";

  // TextEditingControllers;
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _CityController = TextEditingController();
  final TextEditingController _stAddOneController = TextEditingController();
  final TextEditingController _stAddTwoController = TextEditingController();
  final TextEditingController _FNameController = TextEditingController();
  final TextEditingController _LNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: MyDrawer(),
        backgroundColor: Colors.white,
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(height: height, width: width),
                AppBar(
                  backgroundColor: Colors.white,
                  title: Text(
                    "Edit Address",
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
                cInputField(
                    label: "First Name",
                    context: context,
                    hint: "Rita",
                    txController: _FNameController,
                    valids: Validators.novalid),
                cInputField(
                    label: "Last Name",
                    context: context,
                    hint: "Sharma",
                    txController: _LNameController,
                    valids: Validators.novalid),
                // cmInp(title: "State", hint: "State"),
                cInputField(
                    label: "Street Address",
                    context: context,
                    hint: "7921 Parker Rd",
                    txController: _stAddOneController,
                    valids: Validators.novalid),
                cInputField(
                    label: "Stree Address 2 (Optional)",
                    context: context,
                    hint: "4333 Edwards Rd ",
                    txController: _stAddTwoController,
                    valids: Validators.novalid),
                cInputField(
                    label: "City",
                    context: context,
                    hint: "Patna",
                    txController: _CityController,
                    valids: Validators.novalid),
                SizedBox(
                  height: 10,
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  alignment: Alignment.topLeft,
                  child: Consts.titleText(text: "State"),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(
                          1.0,
                          4.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      ), //BoxShadow
                      BoxShadow(
                        color: Colors.grey.shade200,
                        offset: const Offset(2.0, 4.0),
                        blurRadius: 5.0,
                        spreadRadius: 2.0,
                      ), //BoxShadow
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: _selectedState,
                    onChanged: (value) {
                      this._selectedState = value!;
                      setState(() {});
                    },
                    items: stateNameItems,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                cInputField(
                    label: "Pin",
                    context: context,
                    hint: "57797",
                    keyboard: TextInputType.phone,
                    txController: _pinController,
                    valids: Validators.novalid),
                cInputField(
                  label: "Phone Number",
                  context: context,
                  hint: "+91-9875458412",
                  txController: _mobController,
                  keyboard: TextInputType.phone,
                  valids: Validators.mobValid,
                ),
                SizedBox(
                  height: 20,
                ),
                LongButton(
                    width: width * 0.90,
                    height: 50,
                    title: "Save Address",
                    onpress: () {
                      Navigator.of(context).maybePop();
                    }),
                // Constant()
                //     .loginBtn(context: context, title: "Save", onpress: () {}),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
