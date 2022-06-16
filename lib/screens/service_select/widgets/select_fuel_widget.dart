import 'package:bee/utils/colours.dart';
import 'package:flutter/material.dart';

class SelectFuelWidget extends StatefulWidget {
  final double height;
  final double width;
  const SelectFuelWidget(
      {super.key, required this.height, required this.width});

  @override
  State<SelectFuelWidget> createState() => _SelectFuelWidgetState();
}

class _SelectFuelWidgetState extends State<SelectFuelWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
          child: Container(
            height: widget.height * 0.5,
            width: widget.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: selectedIndex == 0 ? Colours().accentColor : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/petrol.png",
                  scale: 0.7,
                ),
                Text(
                  "Petrol",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: selectedIndex == 0
                            ? Colors.white
                            : Colours().kTextColor,
                      ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            selectedIndex = 1;
          }),
          child: Container(
            height: widget.height * 0.5,
            width: widget.width * 0.3,
            decoration: BoxDecoration(
              color: selectedIndex == 1 ? Colours().accentColor : Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/diesel.png",
                  scale: 0.7,
                ),
                Text(
                  "Diesel",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: selectedIndex == 1
                            ? Colors.white
                            : Colours().kTextColor,
                      ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {
            selectedIndex = 2;
          }),
          child: Container(
            height: widget.height * 0.5,
            width: widget.width * 0.3,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
              color: selectedIndex == 2 ? Colours().accentColor : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  "assets/images/cng.png",
                  scale: 0.7,
                ),
                Text(
                  "Cng",
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: selectedIndex == 2
                            ? Colors.white
                            : Colours().kTextColor,
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
