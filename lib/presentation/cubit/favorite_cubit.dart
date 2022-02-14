import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/data/data.dart';
import 'package:save_text_navig/domain/domain.dart';
import 'package:save_text_navig/presentation/presentation.dart';

class FavoriteCubit extends Cubit<bool> {
  FavoriteCubit({
    required this.user,
    required this.usersCubit,
    required this.usersRepository,
  }) : super(user.isFavorite);

  final UsersCubit usersCubit;
  final UsersRepository usersRepository;

  User user;

  Future<void> saveFavorite() async {
    user = user.copyWith(isFavorite: !user.isFavorite);
    await usersRepository.saveUser(user);
    emit(user.isFavorite);
    await usersCubit.getUsers();
  }

  Future<void> removeUser() async {
    await usersRepository.removeUser(user);
    await usersCubit.getUsers();
  }
}
