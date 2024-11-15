// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NfcModel {
  final String id;
  final String token;
  final String url;

  NfcModel({
    required this.id,
    required this.token,
    required this.url,
  });

  NfcModel copyWith({
    String? id,
    String? token,
    String? url,
  }) {
    return NfcModel(
      id: id ?? this.id,
      token: token ?? this.token,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'token': token,
      'url': url,
    };
  }

  factory NfcModel.fromMap(Map<String, dynamic> map) {
    return NfcModel(
      id: map['id'] as String,
      token: map['token'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NfcModel.fromJson(String source) =>
      NfcModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'NfcModel(id: $id, token: $token, url: $url)';

  @override
  bool operator ==(covariant NfcModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.token == token && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ token.hashCode ^ url.hashCode;
}
