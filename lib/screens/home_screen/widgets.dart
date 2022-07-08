import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget featureName() {
  return FittedBox(
    child: Row(children: [
      Image(
        image: AssetImage("assets/images/tick_mark.png"),
        color: Colors.green,
        width: 12,
        height: 12,
      ),
      SizedBox(
        width: 5,
      ),
      AutoSizeText(
        "lorem ipsum",
        minFontSize: 8,
        maxFontSize: 10,
      ),
    ]),
  );
}

class VideoWidget extends StatelessWidget {
  final double width;
  final double height;

  const VideoWidget({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.9,
      height: height * 0.18,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/blog3.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.play_arrow_rounded,
          size: 75,
          color: Colors.white,
        ),
      ),
    );
  }
}

class ExperCareBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.25,
      width: width * 0.9,
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
      ),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AutoSizeText(
            "Expert Care",
            maxFontSize: 28,
            minFontSize: 16,
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w700, color: Colors.red.shade900),
          ),
          AutoSizeText(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit ut aliquam, purus sit amet luctus venenatis, lectus magna  Lorem ipsum dolor sit amet, consectetur adipiscing elit ut",
            maxFontSize: 16,
            minFontSize: 10,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                radius: (height / width) * 10,
              ),
              SizedBox(width: 5),
              AutoSizeText(
                "Amit Kumar",
                maxFontSize: 12,
                minFontSize: 5,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
              Spacer(),
              AutoSizeText(
                "1 month ago",
                maxFontSize: 12,
                minFontSize: 5,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
