import 'package:save_text_navig/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  Repository._();

  static Repository? _repository;

  factory Repository() {
    return _repository ??= Repository._();
  }

  late SharedPreferences _preferences;

  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUser(User user) async {
    await _preferences.setString(user.id, user.toJson());
  }

  Future<List<User>> getUsers() async {
    final listOfUsers = <User>[];
    final listOfKeys = _preferences.getKeys();
    for (final key in listOfKeys) {
      final userString = _preferences.getString(key);
      final user = User.fromJson(key, userString!);
      listOfUsers.add(user);
    }
    return listOfUsers;
  }
}
