import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/favorite_cubit.dart';
import 'package:save_text_navig/favorite_icon.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/user_widget.dart';
import 'package:save_text_navig/users_cubit.dart';

class FavoriteUsersScreen extends StatefulWidget {
  const FavoriteUsersScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteUsersScreen> createState() => _FavoriteUsersScreenState();
}

class _FavoriteUsersScreenState extends State<FavoriteUsersScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UsersCubit, List<User>>(
          builder: (context, state) {
            final favoriteUsers =
                state.where((user) => user.isFavorite).toList();
            return ListView.builder(
              itemCount: favoriteUsers.length,
              itemBuilder: (context, index) {
                return UserWidget(
                  user: favoriteUsers[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
