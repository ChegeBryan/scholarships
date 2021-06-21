import 'package:geopro/models/faq_category.dart';

List<Map<String, dynamic>> faq_categories = [
  {'category': 'ticketing'},
  {'category': 'safety'},
  {'category': 'casuals'},
];

class FaqCategoryList {
  // get faq categories
  List<FaqCategory> getFaqCategories() {
    return faq_categories.map((json) => FaqCategory.fromJson(json)).toList();
  }
}
