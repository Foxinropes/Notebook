import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/delete_user.dart';
import 'package:save_text_navig/favorite_cubit.dart';
import 'package:save_text_navig/favorite_icon.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/users_cubit.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

  void _pushScreen(BuildContext context, [User? user]) async {
    await Navigator.pushNamed(
      context,
      '/saveUser',
      arguments: user,
    );
    context.read<UsersCubit>().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavoriteCubit(
        usersCubit: BlocProvider.of<UsersCubit>(context),
        user: user,
      ),
      child: GestureDetector(
        onTap: () => _pushScreen(context, user),
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(5),
          decoration: BoxDecoration(border: Border.all(color: Colors.black38)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Имя: ${user.text1}',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Favorite(
                    isFavorite: user.isFavorite,
                  ),
                  const DeleteUser(),
                ],
              ),
              Text(
                'Фамилия: ${user.text2}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Отчество: ${user.text3}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Text(
                'Возраст: ${user.text4}',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
