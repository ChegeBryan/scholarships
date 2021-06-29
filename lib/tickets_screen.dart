import 'package:flutter/material.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:intl/intl.dart';

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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 80.0,
              pinned: true,
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
                        DateFormat('d MMM').format(DateTime.now()),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                IconButton(icon: Icon(Icons.chevron_right), onPressed: () {}),
              ],
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Tickets',
                  style: TextStyle(
                    color: Color(0xFF3A5160),
                  ),
                ),
                titlePadding: const EdgeInsetsDirectional.only(start: 16),
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: Text('Tickets go here.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
