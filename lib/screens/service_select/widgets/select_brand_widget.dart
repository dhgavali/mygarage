import 'package:flutter/material.dart';

class SelectBrandListWidget extends StatelessWidget {
  final TabController ctrl;
  final double height;
  static const List<String> img = ["maruti", 'ford', 'kia', 'honda'];
  static const List<String> titel = [
    "MARUTI SUZUKI",
    'FORD MOTORS',
    'KIA',
    'HONDA'
  ];

  const SelectBrandListWidget(
      {super.key, required this.ctrl, required this.height});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, i) => Divider(
        color: Colors.transparent,
      ),
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (ctx, index) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () => ctrl.animateTo(1),
            child: BrandTile(
              height: height,
              title: titel[0],
              img: img[0],
            ),
          ),
          GestureDetector(
            onTap: () => ctrl.animateTo(1),
            child: BrandTile(
              height: height,
              title: titel[1],
              img: img[1],
            ),
          ),
          GestureDetector(
            onTap: () => ctrl.animateTo(1),
            child: BrandTile(
              height: height,
              title: titel[2],
              img: img[2],
            ),
          ),
          GestureDetector(
            onTap: () => ctrl.animateTo(1),
            child: BrandTile(
              height: height,
              title: titel[3],
              img: img[3],
            ),
          ),
        ],
      ),
    );
  }
}

class BrandTile extends StatelessWidget {
  final double height;
  final String title;
  final String img;

  const BrandTile(
      {super.key,
      required this.height,
      required this.title,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.1,
      width: height * 0.11,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: height * 0.07,
            width: height * 0.07,
            child: Image.asset("assets/images/$img.png"),
          ),
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 10, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
