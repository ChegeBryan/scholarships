class FaqCategory {
  final String category;

  FaqCategory({required this.category});

  FaqCategory.fromJson(Map<String, dynamic> json) : category = json['category'];
}
