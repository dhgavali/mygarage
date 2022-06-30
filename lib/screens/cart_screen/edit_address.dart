import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/cart_screen/booking_services.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/service_select/widgets/service_button.dart';
import 'package:bee/utils/constants.dart';
import 'package:bee/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class EditAddressCart extends StatefulWidget {
  @override
  State<EditAddressCart> createState() => EditAddressCartState();
}

class EditAddressCartState extends State<EditAddressCart> {
  String _selectedState = "Andhra Pradesh";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Andhra Pradesh"), value: "Andhra Pradesh"),
      DropdownMenuItem(
          child: Text("Arunachal Pradesh"), value: "Arunachal Pradesh"),
      DropdownMenuItem(child: Text("Assam"), value: "Assam"),
      DropdownMenuItem(child: Text("Bihar"), value: "Bihar"),
      DropdownMenuItem(child: Text("Chhattisgarh"), value: "Chhattisgarh"),
      DropdownMenuItem(child: Text("Goa"), value: "Goa"),
      DropdownMenuItem(child: Text("Gujarat"), value: "Gujarat"),
      DropdownMenuItem(child: Text("Haryana"), value: "Haryana"),
      DropdownMenuItem(
          child: Text("Himachal Pradesh"), value: "Himachal Pradesh"),
      DropdownMenuItem(
          child: Text("Jammu and Kashmir"), value: "Jammu and Kashmir"),
      DropdownMenuItem(child: Text("Jharkhand"), value: "Jharkhand"),
      DropdownMenuItem(child: Text("Karnataka"), value: "Karnataka"),
      DropdownMenuItem(child: Text("Kerala"), value: "Kerala"),
      DropdownMenuItem(child: Text("Madhya Pradesh"), value: "Madhya Pradesh"),
      DropdownMenuItem(child: Text("Maharashtra"), value: "Maharashtra"),
      DropdownMenuItem(child: Text("Manipur"), value: "Manipur"),
      DropdownMenuItem(child: Text("Meghalaya"), value: "Meghalaya"),
      DropdownMenuItem(child: Text("Mizoram"), value: "Mizoram"),
      DropdownMenuItem(child: Text("Nagaland"), value: "Nagaland"),
      DropdownMenuItem(child: Text("Odisha"), value: "Odisha"),
      DropdownMenuItem(child: Text("Punjab"), value: "Punjab"),
      DropdownMenuItem(child: Text("Rajasthan"), value: "Rajasthan"),
      DropdownMenuItem(child: Text("Sikkim"), value: "Sikkim"),
      DropdownMenuItem(child: Text("Tamil Nadu"), value: "Tamil Nadu"),
      DropdownMenuItem(child: Text("Telangana"), value: "Telangana"),
      DropdownMenuItem(child: Text("Tripura"), value: "Tripura"),
      DropdownMenuItem(child: Text("Uttarakhand"), value: "Uttarakhand"),
      DropdownMenuItem(child: Text("Uttar Pradesh"), value: "Uttar Pradesh"),
      DropdownMenuItem(child: Text("West Bengal"), value: "West Bengal"),
      DropdownMenuItem(
          child: Text("Andaman and Nicobar Islands"),
          value: "Andaman and Nicobar Islands"),
      DropdownMenuItem(child: Text("Chandigarh"), value: "Chandigarh"),
      DropdownMenuItem(
          child: Text("Dadra and Nagar Haveli"),
          value: "Dadra and Nagar Haveli"),
      DropdownMenuItem(child: Text("Daman and Diu"), value: "Daman and Diu"),
      DropdownMenuItem(child: Text("Delhi"), value: "Delhi"),
      DropdownMenuItem(child: Text("Lakshadweep"), value: "Lakshadweep"),
      DropdownMenuItem(child: Text("Puducherry"), value: "Puducherry"),
    ];
    return menuItems;
  }

  // TextEditingControllers;
  final TextEditingController _mobController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
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
                  items: dropdownItems,
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
    );
  }

  Widget cInputField({
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
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 20),

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
