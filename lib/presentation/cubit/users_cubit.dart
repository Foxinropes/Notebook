import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/data/repository/users_repository.dart';
import 'package:save_text_navig/domain/entity/user.dart';

class UsersCubit extends Cubit<List<User>> {
  UsersCubit() : super([]);

  final _repository = UsersRepositoryImpl();

  Future<void> getUsers() async {
    final listOfUsers = await _repository.getUsers();
    emit(listOfUsers);
  }
}
