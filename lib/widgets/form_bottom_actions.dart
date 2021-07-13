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
    return Padding(
      padding: const EdgeInsets.fromLTRB(4.0, 8.0, 8.0, 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          TextButton(
            onPressed: action,
            child: Text(
              actionText,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            textColor: Theme.of(context).accentColor,
          ),
        ],
      ),
    );
  }
}
