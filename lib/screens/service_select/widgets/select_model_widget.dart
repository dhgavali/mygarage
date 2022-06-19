import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SelectModelListWidget extends StatelessWidget {
  final TabController ctrl;
  final double height;
  static const List<String> titel = ["SAFARI", 'NEXON', 'INDICA', 'INDIGO'];

  const SelectModelListWidget(
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
            onTap: () => ctrl.animateTo(2),
            child: ModelTile(
              height: height,
              title: titel[0],
            ),
          ),
          GestureDetector(
            onTap: () => ctrl.animateTo(2),
            child: ModelTile(
              height: height,
              title: titel[1],
            ),
          ),
          GestureDetector(
            onTap: () => ctrl.animateTo(2),
            child: ModelTile(
              height: height,
              title: titel[2],
            ),
          ),
          GestureDetector(
            onTap: () => ctrl.animateTo(2),
            child: ModelTile(
              height: height,
              title: titel[3],
            ),
          ),
        ],
      ),
    );
  }
}

class ModelTile extends StatelessWidget {
  final double height;
  final String title;

  const ModelTile({
    super.key,
    required this.height,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        height: height * 0.05,
        width: height * 0.11,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10),
        ),
        child: AutoSizeText(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          minFontSize: 5,
          maxFontSize: 12,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ));
  }
}
