import 'dart:convert';

import 'package:uuid/uuid.dart';

class User {
  static const String _key = 'firstText';
  static const String _key2 = 'secondText';
  static const String _key3 = 'thirdText';
  static const String _key4 = 'fourthText';

  static const _uuid = Uuid();

  User({
    String? id,
    this.text1 = '',
    this.text2 = '',
    this.text3 = '',
    this.text4 = '',
  }) : id = id ?? _uuid.v1();

  User.empty() : this();

  final String id;
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  String toJson() {
    final userMap = <String, String>{};
    userMap[_key] = text1;
    userMap[_key2] = text2;
    userMap[_key3] = text3;
    userMap[_key4] = text4;
    return jsonEncode(userMap);
  }

  factory User.fromJson(String id, String json) {
    final userMap = jsonDecode(json) as Map<String, dynamic>;
    return User(
      id: id,
      text1: userMap[_key] ?? '',
      text2: userMap[_key2] ?? '',
      text3: userMap[_key3] ?? '',
      text4: userMap[_key4] ?? '',
    );
  }
}