class Item {
  final String title;
  final String? imageUrl;
  final String id;
  final DateTime createdDate;
  final Map? fields;

  Item({
    required this.title,
    this.imageUrl,
    required this.id,
    required this.createdDate,
    this.fields,
  });
}
