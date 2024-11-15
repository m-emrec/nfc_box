import '../../constants/enums/item_doc_keys.dart';
import 'field_model.dart';

class Item {
  final String? itemName;
  final String? imageUrl;
  final String? id;
  final DateTime? createdDate;
  final List<FieldModel>? fields;

  Item({
    this.itemName,
    this.imageUrl,
    this.id,
    this.createdDate,
    this.fields,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      itemName: json[ItemDocKeys.itemName.name],
      imageUrl: json[ItemDocKeys.image.name],
      id: json[ItemDocKeys.id.name],
      createdDate: DateTime.fromMillisecondsSinceEpoch(
          json[ItemDocKeys.createdDate.name]),
      fields: json[ItemDocKeys.fields.name]
          .map<FieldModel>((x) => FieldModel.fromJson(x))
          .toList(),
    );
  }

  Item copyWith({
    String? itemName,
    String? imageUrl,
    String? id,
    DateTime? createdDate,
    List<FieldModel>? fields,
  }) {
    return Item(
      itemName: itemName ?? this.itemName,
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      fields: fields ?? this.fields,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      ItemDocKeys.itemName.name: itemName,
      ItemDocKeys.image.name: imageUrl,
      ItemDocKeys.id.name: id,
      ItemDocKeys.createdDate.name: createdDate?.millisecondsSinceEpoch,
      ItemDocKeys.fields.name: fields?.map((x) => x.toMap()).toList(),
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemName: map[ItemDocKeys.itemName.name] != null
          ? map[ItemDocKeys.itemName.name] as String
          : null,
      imageUrl: map[ItemDocKeys.image.name] != null
          ? map[ItemDocKeys.image.name] as String
          : null,
      id: map[ItemDocKeys.id.name] != null
          ? map[ItemDocKeys.id.name] as String
          : null,
      createdDate: map[ItemDocKeys.createdDate.name] != null
          ? DateTime.fromMillisecondsSinceEpoch(
              map[ItemDocKeys.createdDate.name] as int)
          : null,
      fields: map[ItemDocKeys.fields.name] != null
          ? List<FieldModel>.from(
              (map[ItemDocKeys.fields.name] as List).map<FieldModel?>(
                (x) => FieldModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}
