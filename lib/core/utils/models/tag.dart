// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'item.dart';

class Tag {
  final String? name;
  final String? token;
  final List<Item>? items;

  Tag({
    this.name,
    this.token,
    this.items,
  });

  Tag copyWith({
    String? name,
    String? token,
    List<Item>? items,
  }) {
    return Tag(
      name: name ?? this.name,
      token: token ?? this.token,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'token': token,
      'items': items?.map((Item x) => x.toMap()).toList()
          as List<Map<String, dynamic>>,
    };
  }

  factory Tag.fromMap(Map<String, dynamic> map) {
    return Tag(
      name: map['name'] != null ? map['name'] as String : null,
      token: map['token'] as String,
      items: map['items'] != null
          ? List<Item>.from(
              (map['items']).map<Item?>(
                (x) => Item.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tag.fromJson(String source) =>
      Tag.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Tag(name: $name, token: $token, items: $items)';

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.token == token &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode => name.hashCode ^ token.hashCode ^ items.hashCode;
}
