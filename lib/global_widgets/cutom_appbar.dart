import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.09,
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                    size: height * 0.025,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              AutoSizeText(
                "My Garage",
                maxFontSize: 16,
                minFontSize: 5,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w700, color: Colors.white),
              ),
              const SizedBox(width: 10),
              Icon(Icons.notifications_none_outlined,
                  color: Colors.white, size: height * 0.02),
              Spacer(),
              Container(
                alignment: Alignment.center,
                height: height * 0.065,
                width: width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(50))),
                child: Image.asset(
                  "assets/images/thar.png",
                  scale: 0.8,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                Icons.location_pin,
                color: Colors.white,
                size: height * 0.025,
              ),
              SizedBox(width: 10),
              AutoSizeText(
                "Patna, Bihar",
                maxLines: 1,
                maxFontSize: 12,
                minFontSize: 5,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              SizedBox(width: 10),
              AutoSizeText(
                "Mahendra Thar (Diesel)",
                maxLines: 1,
                maxFontSize: 12,
                minFontSize: 5,
                overflow: TextOverflow.clip,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ],
      ),
    );
  }
}
