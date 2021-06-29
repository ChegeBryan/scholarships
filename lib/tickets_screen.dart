import 'package:flutter/material.dart';
import 'package:geopro/widgets/app_drawer.dart';

class TicketsScreen extends StatefulWidget {
  const TicketsScreen({Key key}) : super(key: key);

  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(color: Color(0xFF3A5160)),
          textTheme: TextTheme(
            body1: TextStyle(color: Color(0xFF3A5160)),
            title: TextStyle(color: Color(0xFF3A5160)),
          ),
          color: Theme.of(context).backgroundColor,
        ),
      ),
      child: Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text('Title'),
          elevation: 0,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.chevron_left), onPressed: () {}),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Icon(
                  Icons.calendar_today,
                  size: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    '29 Jun',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            IconButton(icon: Icon(Icons.chevron_right), onPressed: () {}),
          ],
        ),
        body: Center(
          child: Text('Tickets'),
        ),
      ),
    );
  }
}
