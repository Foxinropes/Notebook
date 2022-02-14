import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/data/data.dart';
import 'package:save_text_navig/domain/domain.dart';

class SaveUserCubit extends Cubit<User> {
  SaveUserCubit({User? user}) : super(user ?? User.empty());

  final _repository = UsersRepositoryImpl();

  void init() {
    emit(state);
  }

  Future<void> saveText(User user) async {
    await _repository.saveUser(user);
  }
}
