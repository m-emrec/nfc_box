import '../../../core/utils/models/field_model.dart';

class Item {
  final String title;
  final String? imageUrl;
  final String id;
  final DateTime createdDate;
  final List<FieldModel> fields;

  Item({
    required this.title,
    this.imageUrl,
    required this.id,
    required this.createdDate,
    required this.fields,
  });
}
