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
    await _preferences.reload();
  }

  Future<void> removeUser(User user) async {
    await _preferences.remove(user.id);
    await _preferences.reload();
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
