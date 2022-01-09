import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/repository.dart';
import 'package:save_text_navig/user.dart';

class UsersCubit extends Cubit<List<User>> {
  UsersCubit() : super([]);

  final _repository = Repository();

  Future<void> getUsers() async {
    final listOfUsers = await _repository.getUsers();
    emit(listOfUsers);
  }
}
