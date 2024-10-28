// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import '../../../core/constants/enums/item_doc_keys.dart';

import '../../../core/utils/models/field_model.dart';

/// This model used for creating a new item
///
/// title`[String]` is the title of the item
///
/// imageUrl [String] is the image url of the item
///
/// id [String] is the id of the item
///
/// createdDate[DateTime] is the date when the item is created
///
/// fields [Map] is the list of fields of the item
class CreateItemModel {
  final String? itemName;
  final String? imageUrl;
  final String? id;
  final DateTime? createdDate;
  final List<FieldModel>? fields;

  CreateItemModel({
    this.itemName,
    this.imageUrl,
    this.id,
    this.createdDate,
    this.fields,
  });

  CreateItemModel copyWith({
    String? itemName,
    String? imageUrl,
    String? id,
    DateTime? createdDate,
    List<FieldModel>? fields,
  }) {
    return CreateItemModel(
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

  factory CreateItemModel.fromMap(Map<String, dynamic> map) {
    return CreateItemModel(
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
              (map[ItemDocKeys.fields.name] as List<int>).map<FieldModel?>(
                (x) => FieldModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateItemModel.fromJson(String source) =>
      CreateItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateItemModel(title: $itemName, imageUrl: $imageUrl, id: $id, createdDate: $createdDate, fields: $fields)';
  }

  @override
  bool operator ==(covariant CreateItemModel other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName &&
        other.imageUrl == imageUrl &&
        other.id == id &&
        other.createdDate == createdDate &&
        listEquals(other.fields, fields);
  }

  @override
  int get hashCode {
    return itemName.hashCode ^
        imageUrl.hashCode ^
        id.hashCode ^
        createdDate.hashCode ^
        fields.hashCode;
  }
}
