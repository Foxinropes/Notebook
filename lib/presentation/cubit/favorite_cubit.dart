import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/data/data.dart';
import 'package:save_text_navig/domain/domain.dart';
import 'package:save_text_navig/presentation/presentation.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit({
    required this.user,
    required this.usersCubit,
  }) : super(user.isFavorite);

  final UsersCubit usersCubit;

  User user;

  final _repository = UsersRepository();

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
