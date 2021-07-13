import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:intl/intl.dart';

import 'package:date_range_picker/date_range_picker.dart' as DateRangePicker;

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
            bodyText1: TextStyle(color: Color(0xFF3A5160)),
            headline6: TextStyle(color: Color(0xFF3A5160)),
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
                titlePadding: const EdgeInsetsDirectional.only(start: 20),
              ),
              //backgroundColor: Colors.blue,
            ),
            SliverFiltersHeader(),
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

class SliverFiltersHeader extends StatelessWidget {
  SliverFiltersHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverAppBarDelegate(
        minHeight: 136.0,
        maxHeight: 136.0,
        child: Container(
          padding: const EdgeInsets.all(12.0),
          // color: Colors.cyan,
          //height: 48.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Material(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  child: SizedBox(
                    height: 48.0,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          color: Theme.of(context).textTheme.bodyText1.color,
                        ),
                        hintText: 'Search by Technician or Ticket Number',
                        hintStyle: TextStyle(
                          color: Color(0xFF9E9E9E),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: DateRangePickerButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateRangePickerButton extends StatefulWidget {
  const DateRangePickerButton({
    Key key,
  }) : super(key: key);

  @override
  _DateRangePickerButtonState createState() => _DateRangePickerButtonState();
}

class _DateRangePickerButtonState extends State<DateRangePickerButton> {
  List<DateTime> dateRange = [];

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Text(
              dateRange.length == 0
                  ? 'Select a date or date range'
                  : dateRange.length == 1
                      ? DateFormat.yMMMd().format(dateRange[0])
                      : (DateFormat.yMMMd().format(dateRange[0]) +
                          ' - ' +
                          DateFormat.yMMMd().format(dateRange[1])),
            ),
          ),
          Icon(Icons.chevron_right)
        ],
      ),
      onPressed: () async {
        final List<DateTime> picked = await DateRangePicker.showDatePicker(
          context: context,
          initialFirstDate: dateRange.length != 0
              ? dateRange[0]
              : (DateTime.now()).subtract(Duration(days: 7)),
          initialLastDate: dateRange.length != 0 && dateRange.length == 2
              ? dateRange[1]
              : dateRange.length == 1
                  ? dateRange[0]
                  : DateTime.now(),
          firstDate: new DateTime(2020),
          lastDate: new DateTime.now(),
        );

        if (picked != null) {
          setState(() {
            dateRange = picked;
          });
        }
      },
    );
  }
}

class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
