// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:nfc_box/features/create%20item/model/field_model.dart';

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
  final String? title;
  final String? imageUrl;
  final String? id;
  final DateTime? createdDate;
  final List<FieldModel>? fields;

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
    List<FieldModel>? fields,
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
      'fields': fields?.map((x) => x.toMap()).toList(),
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
      fields: map['fields'] != null
          ? List<FieldModel>.from(
              (map['fields'] as List<int>).map<FieldModel?>(
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
    return 'CreateItemModel(title: $title, imageUrl: $imageUrl, id: $id, createdDate: $createdDate, fields: $fields)';
  }

  @override
  bool operator ==(covariant CreateItemModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.id == id &&
        other.createdDate == createdDate &&
        listEquals(other.fields, fields);
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        id.hashCode ^
        createdDate.hashCode ^
        fields.hashCode;
  }
}
