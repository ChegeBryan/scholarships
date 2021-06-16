import 'package:geopro/models/faq_category.dart';

class Faq extends FaqCategory {
  String question;
  String answer;
  List<String> images;

  Faq({this.question, this.answer, this.images});
}
