
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar(
      {Key? key,
      required double height,
      required double width,
      String hint = "Search Here"})
      : _height = height,
        _width = width,
        hint = hint,
        super(key: key);

  final double _height;
  final String hint;
  final double _width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1, color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: _height * 0.05, maxWidth: _width * 0.6),
              child: TextField(
                cursorColor: Colors.black,
                decoration: InputDecoration.collapsed(
                  hintText: hint,
                ),
              )),
          Card(
            elevation: 8,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8),
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
