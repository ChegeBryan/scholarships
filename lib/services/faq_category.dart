import 'package:geopro/models/faq_category.dart';

List<Map<String, dynamic>> faqCategories = [
  {'category': 'ticketing'},
  {'category': 'safety'},
  {'category': 'casuals'},
];

class FaqCategoryList {
  // get faq categories
  List<FaqCategory> getFaqCategories() {
    return faqCategories.map((json) => FaqCategory.fromJson(json)).toList();
  }
}
