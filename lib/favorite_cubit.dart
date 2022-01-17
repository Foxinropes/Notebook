import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/repository.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/users_cubit.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit({
    required this.user,
    required this.usersCubit,
  }) : super(user.isFavorite);

  final UsersCubit usersCubit;

  User user;

  final _repository = Repository();

  Future<void> saveFavorite() async {
    user = user.copyWith(isFavorite: !user.isFavorite);
    await _repository.saveUser(user);
    emit(user.isFavorite);
    await usersCubit.getUsers();
  }

  Future<void> removeUser() async {
    await _repository.removeUser(user);
    await usersCubit.getUsers();
  }
}
