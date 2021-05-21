import 'package:flutter/material.dart';

class ApplicationDetailInfo extends StatelessWidget {
  final String detailFor;
  final String detailText;

  const ApplicationDetailInfo({Key key, this.detailFor, this.detailText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            detailFor,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            detailText,
            textAlign: TextAlign.end,
            softWrap: true,
          ),
        ),
      ],
    );
  }
}
