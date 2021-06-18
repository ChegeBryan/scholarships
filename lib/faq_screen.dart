import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:geopro/widgets/category_card.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<String> categories = [
    'Ticketing',
    'Safety',
    'Casuals',
    'Category 4',
    'Category 5'
  ];

  int currentSelectedCategory;

  @override
  Widget build(BuildContext context) {
    Widget appBar = SliverAppBar(
      pinned: false,
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

    Widget searchBox = Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 14.0),
        child: TextField(
          autofocus: false,
          cursorColor: Color(0xff3A5160),
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              color: Color(0xff9E9E9E),
            ),
            hintText: 'What do you want to know?',
            hintStyle: TextStyle(
              color: Color(0xff9E9E9E),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide(color: Color(0xff9E9E9E)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xff9E9E9E)),
              borderRadius: BorderRadius.circular(16.0),
            ),
          ),
          style: TextStyle(
            color: Color(0xff3A5160),
          ),
        ),
      ),
    );

    return Scaffold(
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          appBar,
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
              margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
              height: 60.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    categoryName: categories[index],
                    index: index,
                    isSelected: currentSelectedCategory == index,
                    onSelect: () {
                      setState(() {
                        if (currentSelectedCategory != index) {
                          currentSelectedCategory = index;
                        } else {
                          currentSelectedCategory = null;
                        }
                      });
                    },
                  );
                },
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              searchBox,
            ]),
          ),
        ],
      ),
    );
  }
}
