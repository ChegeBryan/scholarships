import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
      child: FlatButton(
        onPressed: widget.onSelect,
        color: widget.isSelected ? Color(0xff1E22AA) : Colors.white70,
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 1.0),
        child: Text(
          widget.categoryName,
          style: TextStyle(
              color: widget.isSelected ? Colors.white : Color(0xff3A5160),
              fontWeight: FontWeight.bold),
        ),
        shape: widget.isSelected
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.transparent))
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Color(0xff9E9E9E))),
      ),
    );
  }
}
