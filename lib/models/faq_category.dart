class FaqCategory {
  final String category;

  FaqCategory({this.category});

  FaqCategory.fromJson(Map<String, dynamic> json) : category = json['category'];
}
