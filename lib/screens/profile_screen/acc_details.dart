import 'package:bee/global_widgets/cutom_appbar.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';

class AccountDetails extends StatelessWidget {
  const AccountDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              CustomAppBar(height: height, width: width),
              profileBanner(
                width: width,
                height: height,
              ),
            ],
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
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              "My Profile",
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
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 2,
              ),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Stack(
              children: [
                CircleAvatar(
                  maxRadius: 25,
                  minRadius: 20,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/images/cart.png"),
                ),
                Positioned(
                  bottom: 5,
                  right: 8,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          width: 3.0,
                          color: Color(0xffa1a1a1),
                        ),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 20.0,
                      ),
                    ),
                  ),
                ),
              ],
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
