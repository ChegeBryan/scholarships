import 'package:flutter/material.dart';
import 'package:geopro/models/faq.dart';
import 'package:geopro/models/faq_category.dart';
import 'package:geopro/services/faq.dart';
import 'package:geopro/services/faq_category.dart';
import 'package:geopro/widgets/app_drawer.dart';
import 'package:geopro/widgets/category_card.dart';
import 'package:geopro/widgets/question_answer_widget.dart';
import 'package:geopro/helpers/string_extensions.dart';

class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  List<FaqCategory> categories = FaqCategoryList().getFaqCategories();

  List<Faq> faqs;

  int currentSelectedCategory;

  @override
  void initState() {
    faqs = FaqList().getFaqs();
    super.initState();
  }

  void filterByQuestions(String query) {
    List<Faq> startingSearchList = List<Faq>();
    startingSearchList.addAll(faqs);
    if (query.isNotEmpty) {
      List<Faq> filteredListData = List<Faq>();
      startingSearchList.forEach((item) {
        if (item.question.toLowerCase().contains(query.toLowerCase())) {
          filteredListData.add(item);
        }
      });
      setState(() {
        faqs.clear();
        faqs.addAll(filteredListData);
      });
      return;
    } else {
      setState(() {
        faqs.clear();
        faqs = FaqList().getFaqs();
      });
    }
  }

  TextEditingController _query = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget appBar = SliverAppBar(
      pinned: false,
      expandedHeight: 80.0,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.fromLTRB(42.0, 0, 0, 0),
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.7,
          ),
          child: Text(
            'Frequently Asked Questions:',
            style: TextStyle(
                color: Color(0xff3A5160),
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
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
          color: Color(0xffF5F5F5),
          borderRadius: BorderRadius.circular(16.0),
        ),
        width: MediaQuery.of(context).size.width * 0.9,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 14.0),
        child: TextField(
          controller: _query,
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
          onChanged: (value) {
            filterByQuestions(value);
          },
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
              margin: const EdgeInsets.all(16.0),
              height: 48.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ChoiceChip(
                      label: Text(
                        categories[index].category.inCaps,
                        style: TextStyle(
                          color: Color(0xFF3A5160),
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      elevation: 6,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 12.0,
                      ),
                      selected: currentSelectedCategory == index,
                      selectedColor: Color(0xFFEBEAEA),
                      backgroundColor: Theme.of(context).backgroundColor,
                      onSelected: (bool selected) {
                        setState(() {
                          if (currentSelectedCategory != index) {
                            currentSelectedCategory = index;
                            faqs = FaqList().getFaqsByCategory(
                                categories[index].category.toLowerCase());
                          } else {
                            currentSelectedCategory = null;
                            faqs = FaqList().getFaqs();
                          }
                        });
                      },
                    ),
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
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return QuestionAnswerWidget(
                  question: faqs[index].question,
                  answer: faqs[index].answer,
                  screenshots: faqs[index].images,
                );
              },
              childCount: faqs.length,
            ),
          )
        ],
      ),
    );
  }
}
