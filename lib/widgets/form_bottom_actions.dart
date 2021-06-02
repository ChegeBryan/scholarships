import 'package:flutter/material.dart';

class FormBottomActions extends StatelessWidget {
  final String message;
  final String actionText;
  final Function action;

  const FormBottomActions({
    Key key,
    @required this.message,
    @required this.action,
    @required this.actionText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          message,
          style: TextStyle(color: Colors.white),
        ),
        FlatButton(
          onPressed: action,
          child: Text(actionText),
          textColor: Colors.white,
        ),
      ],
    );
  }
}
