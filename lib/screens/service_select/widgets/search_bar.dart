import 'package:bee/utils/colours.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required double height,
    required double width,
  })  : _height = height,
        _width = width,
        super(key: key);

  final double _height;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colours().kTextColor)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: _height * 0.05, maxWidth: _width * 0.6),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration.collapsed(
                  hintText: "Search Here",
                ),
              )),
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Icon(
                Icons.search_rounded,
                color: Colors.black,
                size: 28,
              ),
            ),
          )
        ],
      ),
    );
  }
}
