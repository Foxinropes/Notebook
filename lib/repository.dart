import 'package:save_text_navig/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Repository._();

  static Repository? _repository;

  factory Repository() {
    return _repository ??= Repository._();
  }

  static const String _key = 'firstText';
  static const String _key2 = 'secondText';
  static const String _key3 = 'thirdText';
  static const String _key4 = 'fourthText';

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveText(
      String text, String text2, String text3, String text4) async {
    await _preferences.setString(_key, text);
    await _preferences.setString(_key2, text2);
    await _preferences.setString(_key3, text3);
    await _preferences.setString(_key4, text4);
  }

  Texts getText() {
    final text1 = _preferences.getString(_key);
    final text2 = _preferences.getString(_key2);
    final text3 = _preferences.getString(_key3);
    final text4 = _preferences.getString(_key4);
    final texts = Texts(text1, text2, text3, text4);
    return texts;
  }
}
