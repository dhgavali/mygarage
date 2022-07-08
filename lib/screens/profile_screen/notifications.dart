import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/screens/cart_screen/empty_cart.dart';
import 'package:bee/screens/cart_screen/filled_cart.dart';
import 'package:bee/screens/profile_screen/empty_notify.dart';
import 'package:bee/screens/service_select/widgets/appbar.dart';
import 'package:bee/screens/sos_screen/sos_screen.dart';
import 'package:bee/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../global_widgets/custom_scaffold.dart';

class GetNotification extends StatefulWidget {
  @override
  State<GetNotification> createState() => _GetNotificationState();
}

class _GetNotificationState extends State<GetNotification> {
  late bool isNotifications;

  // Future<void> getData() async {
  //   await Future.delayed(Duration(seconds: 2));
  //   setState(() {
  //     isNotifications = false;
  //   });
  // }

  @override
  void initState() {
    super.initState();
    isNotifications = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FilledNotifs();
  }
}

class FilledNotifs extends StatefulWidget {
  const FilledNotifs({Key? key}) : super(key: key);

  @override
  State<FilledNotifs> createState() => _FilledNotifsState();
}

class _FilledNotifsState extends State<FilledNotifs> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          drawer: MyDrawer(),
          body: Container(
            height: height * 0.8,
            child: Column(
              children: [
                Column(
                  children: [
                    CustomAppBar(height: height, width: width),
                    AppBar(
                      backgroundColor: Colors.white,
                      title: Text(
                        "Notifications",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      centerTitle: true,
                      elevation: 0.0,
                      leading: MyBackButton(),
                      actions: [
                        GestureDetector(
                          onTap: () {
                            //TODO: delete notifications
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Icon(
                              Icons.delete_outline,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: height * 0.01,
                  color: Colors.transparent,
                ),
                notifyBox(
                  title: "New service",
                  subtitle: "Lorem Ipsum Dolor",
                  timeline: "June 5, 2022 5:06 Pm",
                ),
                notifyBox(
                  title: "New service",
                  subtitle: "Lorem Ipsum Dolor",
                  timeline: "June 5, 2022 5:06 Pm",
                ),
                notifyBox(
                  title: "New service",
                  subtitle: "Lorem Ipsum Dolor",
                  timeline: "June 5, 2022 5:06 Pm",
                ),
                notifyBox(
                  title: "Verify your account",
                  subtitle: "Lorem Ipsum Dolor",
                  image: "notice",
                ),
                notifyBox(
                  title: "Welcome Back !",
                  image: "notice",
                ),
              ],
            ),
          )),
    );
  }

  Widget notifyBox({
    String? image,
    required String title,
    String? subtitle,
    String? timeline,
  }) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: Colors.grey.shade300,
      ))),
      padding: EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                minRadius: 15,
                maxRadius: 20,
                backgroundColor:
                    image == null ? Colors.grey : Colors.transparent,
                child: image == null
                    ? Container()
                    : Image(
                        image: AssetImage("assets/images/notice.png"),
                      ),
                // backgroundImage: image == null  ? ImageProvider() : Container(),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consts.titleText(
                    text: title,
                  ),
                  subtitle != null
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Text(
                            subtitle,
                            style: Consts.greyFont(12),
                          ),
                        )
                      : Container(),
                  timeline != null
                      ? Text(
                          timeline,
                          style: Consts.greyFont(10),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          Container(
            width: 5,
            height: 5,
            alignment: Alignment.topRight,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
