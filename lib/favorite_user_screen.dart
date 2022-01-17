import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/favorite_cubit.dart';
import 'package:save_text_navig/favorite_icon.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/users_cubit.dart';

class FavoriteUsersScreen extends StatefulWidget {
  const FavoriteUsersScreen({Key? key}) : super(key: key);

  @override
  _FavoriteUsersScreenState createState() => _FavoriteUsersScreenState();
}

class _FavoriteUsersScreenState extends State<FavoriteUsersScreen> {
  late final UsersCubit _usersCubit;

  @override
  void initState() {
    _usersCubit = UsersCubit();
    _usersCubit.getUsers();
    super.initState();
  }

  @override
  void dispose() {
    _usersCubit.close();
    super.dispose();
  }

  void _pushScreen([User? user]) async {
    await Navigator.pushNamed(
      context,
      '/saveUser',
      arguments: user,
    );
    _usersCubit.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<UsersCubit, List<User>>(
          bloc: _usersCubit,
          builder: (context, state) {
            final favoriteUsers =
                state.where((user) => user.isFavorite).toList();
            return ListView.builder(
              itemCount: favoriteUsers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _pushScreen(favoriteUsers[index]),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Имя: ${favoriteUsers[index].text1}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            const Expanded(child: SizedBox()),
                            Favorite(user: favoriteUsers[index]),
                          ],
                        ),
                        Text(
                          'Фамилия: ${favoriteUsers[index].text2}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Отчество: ${favoriteUsers[index].text3}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Возраст: ${favoriteUsers[index].text4}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
