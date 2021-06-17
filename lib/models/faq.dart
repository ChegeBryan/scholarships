import 'package:geopro/models/faq_category.dart';

class Faq extends FaqCategory {
  final String question;
  final String answer;
  final List<String> images;

  Faq({this.question, this.answer, this.images, String category})
      : super(category: category);
}
