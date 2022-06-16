import 'package:bee/utils/routes.dart';
import 'package:flutter/material.dart';

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
            Navigator.of(context).pushNamed(RouteName.SOS_screen);
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
            radius: width * 0.15,
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
