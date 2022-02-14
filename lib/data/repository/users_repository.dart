import 'package:save_text_navig/domain/entity/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class UsersRepository {
  Future<void> init();

  Future<void> saveUser(User user);

  Future<void> removeUser(User user);

  Future<List<User>> getUsers();
}

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl._();

  static UsersRepositoryImpl? _repository;

  factory UsersRepositoryImpl() {
    return _repository ??= UsersRepositoryImpl._();
  }

  late SharedPreferences _preferences;

  @override
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> saveUser(User user) async {
    await _preferences.setString(user.id, user.toJson());
    await _preferences.reload();
  }

  @override
  Future<void> removeUser(User user) async {
    await _preferences.remove(user.id);
    await _preferences.reload();
  }

  @override
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
