import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/repository.dart';

class RepositoryCubit extends Cubit<User> {
  RepositoryCubit() : super(User('', '', '', ''));

  final _repository = Repository();

  Future<void> init() async {
    final text = await _repository.getText();
    emit(text);
  }

  Future<void> saveText(
      String text1, String text2, String text3, String text4) async {
    await _repository.saveText(text1, text2, text3, text4);
  }
}

class User {
  User(this.text1, this.text2, this.text3, this.text4);

  final String? text1;
  final String? text2;
  final String? text3;
  final String? text4;
}
