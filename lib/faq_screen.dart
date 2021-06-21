import 'package:flutter/material.dart';
import 'package:geopro/services/faq.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:geopro/widgets/category_card.dart';

final faqs = FaqList().getFaqs();

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
      expandedHeight: 150.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(18.0, 0, 0, 0),
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            'Frequently Asked Questions:',
            style: TextStyle(
                color: Color(0xff3A5160),
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                fontFamily: 'AvenirLTStd-MediumRegular',
                letterSpacing: 1.0),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      iconTheme: IconThemeData(color: Color(0xff3A5160)),
    );

    Widget searchBox = Center(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFEBEAEA),
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 14.0),
        child: TextField(
          autofocus: false,
          cursorColor: Color(0xff3A5160),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(10.0),
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
              borderSide: BorderSide(color: Colors.transparent),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
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
      backgroundColor: Theme.of(context).backgroundColor,
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
