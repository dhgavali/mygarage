import 'package:auto_size_text/auto_size_text.dart';
import 'package:bee/global_widgets/persistence_nav_bar.dart';
import 'package:bee/screens/sos_screen/sos_screen.dart';
import 'package:bee/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class ServiceButton extends StatelessWidget {
  final double width;
  final double height;
  final String img;
  final bool isSos;
  const ServiceButton({
    super.key,
    required this.width,
    required this.height,
    required this.img,
    required this.isSos,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isSos) {
          if (img == 'sos') {
            Navigator.of(context).pushNamed(RouteName.Select_SOS_screen);
          } else {
            // Navigator.of(context).pushNamed();
            pushNewScreen(context,
                screen: PersistentNavBar(
                  initial: 2,
                ),
                pageTransitionAnimation: PageTransitionAnimation.cupertino);
          }
        } else {
          Navigator.of(context).pushNamed(RouteName.Select_vehicle_screen);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: height * 0.06,
            backgroundColor: Colors.transparent,
            backgroundImage: AssetImage("assets/images/circles.png"),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: height * 0.1, maxWidth: height * 0.1),
              child: Image.asset("assets/images/$img.png"),
            ),
          ),
          Divider(height: 5),
          Text(
            img.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: 12, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

class BookButton extends StatelessWidget {
  final double width;
  final double height;
  final Function() onpress;
  final String title;

  const BookButton({
    required this.width,
    required this.height,
    required this.onpress,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: width / 2,
        height: height,
        child: Center(
          child: AutoSizeText(title,
              maxFontSize: 22,
              minFontSize: 12,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              )),
        ),
      ),
    );
  }
}

class LongButton extends StatelessWidget {
  final double width;
  final double height;
  final String title;
  final Color bgColor;
  final Function() onpress;

  const LongButton({
    required this.width,
    required this.height,
    required this.title,
    required this.onpress,
    this.bgColor = const Color(0xFFFF0000),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        width: width * 0.95,
        margin: EdgeInsets.only(
          bottom: 10,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: bgColor, borderRadius: BorderRadius.circular(10)),
        height: height,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
