import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/repository.dart';
import 'package:save_text_navig/user.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit({required this.user}) : super(user.isFavorite);

  User user;

  final _repository = Repository();

  Future<void> saveFavorite() async {
    user = user.copyWith(isFavorite: !user.isFavorite);
    await _repository.saveUser(user);
    emit(user.isFavorite);
  }
}