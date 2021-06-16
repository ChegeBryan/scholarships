import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geopro/widgets/app_drawer.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<String> categories = [
    'Requirements',
    'Deadline',
    'Application Process',
    'Eligibility',
    'Category 5',
    'Category 6',
    'Category 7',
    'Category 8',
    'Category 9'
  ];

  @override
  Widget build(BuildContext context) {
    Widget appBar = SliverAppBar(
      pinned: true,
      floating: true,
      expandedHeight: 250.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          'Frequently Asked \n Questions',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
              fontFamily: 'AvenirLTStd-MediumRegular',
              letterSpacing: 1.0),
        ),
        centerTitle: true,
        background: Image.asset('assets/background.jpeg', fit: BoxFit.cover),
      ),
    );

    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          appBar,
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
              height: 60.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(categoryName: categories[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryName;

  CategoryCard({this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(12.0),
      alignment: Alignment.center,
      child: Text(
        categoryName,
        style: TextStyle(color: Color(0xff3A5160), fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
          border: Border.all(
            color: Color(0xff9E9E9E),
          ),
          borderRadius: BorderRadius.circular(32.0)),
    );
  }
}
