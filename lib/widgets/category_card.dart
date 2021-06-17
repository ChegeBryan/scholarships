import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final String categoryName;

  CategoryCard({this.categoryName});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 6.0),
      child: FlatButton(
        color: _isPressed ? Color(0xff1E22AA) : null,
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 1.0),
        child: Text(
          widget.categoryName,
          style: TextStyle(
              color: _isPressed ? Colors.white : Color(0xff3A5160),
              fontWeight: FontWeight.bold),
        ),
        shape: _isPressed
            ? RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Colors.transparent))
            : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                side: BorderSide(color: Color(0xff9E9E9E))),
        onPressed: () {
          setState(() {
            _isPressed = !_isPressed;
          });
        },
      ),
    );
  }
}
