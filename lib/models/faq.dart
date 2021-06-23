import 'package:geopro/models/faq_category.dart';

class Faq {
  final String question;
  final String answer;
  final List<String> images;
  final String category;

  Faq({this.question, this.answer, this.images, this.category});

  Faq.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        answer = json['answer'],
        images = json['images'],
        category = json['category'];
}
