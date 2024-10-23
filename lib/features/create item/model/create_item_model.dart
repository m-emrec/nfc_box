// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

/// This model used for creating a new item
class CreateItemModel {
  final String? title;
  final String? imageUrl;
  final String? id;
  final DateTime? createdDate;
  final Map? fields;

  CreateItemModel({
    this.title,
    this.imageUrl,
    this.id,
    this.createdDate,
    this.fields,
  });

  CreateItemModel copyWith({
    String? title,
    String? imageUrl,
    String? id,
    DateTime? createdDate,
    Map? fields,
  }) {
    return CreateItemModel(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
      fields: fields ?? this.fields,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'id': id,
      'createdDate': createdDate?.millisecondsSinceEpoch,
      'fields': fields,
    };
  }

  factory CreateItemModel.fromMap(Map<String, dynamic> map) {
    return CreateItemModel(
      title: map['title'] != null ? map['title'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      createdDate: map['createdDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdDate'] as int)
          : null,
      fields: Map.from(
        (map['fields'] as Map),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateItemModel.fromJson(String source) =>
      CreateItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateItemModel(title: $title, imageUrl: $imageUrl, id: $id, createdDate: $createdDate, fields: $fields)';
  }
}
