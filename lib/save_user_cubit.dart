import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/repository.dart';
import 'package:save_text_navig/user.dart';

class SaveUserCubit extends Cubit<User> {
  SaveUserCubit({User? user}) : super(user ?? User.empty());

  final _repository = Repository();

  void init() {
    emit(state);
  }

  Future<void> saveText(User user) async {
    await _repository.saveUser(user);
  }
}
