import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geopro/helpers/string_extensions.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;
  final int index;
  final bool isSelected;
  final VoidCallback onSelect;

  CategoryCard({this.categoryName, this.index, this.isSelected, this.onSelect});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 12.0),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(50.0), boxShadow: [
        BoxShadow(
          color: Color(0xffDCDCDC),
          spreadRadius: -2,
          offset: Offset(1.0, 1.0),
        ),
      ]),
      child: Card(
        elevation: 6,
        shape: widget.isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.transparent))
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.transparent)),
        color: widget.isSelected
            ? Color(0xFF1E22AA)
            : Theme.of(context).backgroundColor,
        child: InkWell(
          onTap: widget.onSelect,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
            child: Text(
              widget.categoryName.inCaps,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff3A5160), fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
