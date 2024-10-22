class Item {
  final String title;
  final String? imageUrl;
  final String id;
  final DateTime createdDate;

  Item({
    required this.title,
    this.imageUrl,
    required this.id,
    required this.createdDate,
  });
}
