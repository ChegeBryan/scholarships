class Faq {
  final String question;
  final String answer;
  final List? images;
  final String category;

  Faq(
      {required this.question,
      required this.answer,
      this.images,
      required this.category});

  Faq.fromJson(Map<String, dynamic> json)
      : question = json['question'],
        answer = json['answer'],
        images = json['images'],
        category = json['category'];
}
