// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CreateItemModel {
  final String? title;
  final String? imageUrl;
  final String? id;
  final DateTime? createdDate;

  CreateItemModel({
    this.title,
    this.imageUrl,
    this.id,
    this.createdDate,
  });

  CreateItemModel copyWith({
    String? title,
    String? imageUrl,
    String? id,
    DateTime? createdDate,
  }) {
    return CreateItemModel(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      id: id ?? this.id,
      createdDate: createdDate ?? this.createdDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'id': id,
      'createdDate': createdDate?.millisecondsSinceEpoch,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateItemModel.fromJson(String source) =>
      CreateItemModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CreateItemModel(title: $title, imageUrl: $imageUrl, id: $id, createdDate: $createdDate)';
  }

  @override
  bool operator ==(covariant CreateItemModel other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.imageUrl == imageUrl &&
        other.id == id &&
        other.createdDate == createdDate;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        imageUrl.hashCode ^
        id.hashCode ^
        createdDate.hashCode;
  }
}
