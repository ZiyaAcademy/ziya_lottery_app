class FAQModel {
  final String title;
  final String content;
  bool isExpanded;

  FAQModel({
    required this.title,
    required this.content,
    this.isExpanded = false,
  });
}
