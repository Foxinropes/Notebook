import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/users_cubit.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
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
      floatingActionButton: FloatingActionButton(
        onPressed: _pushScreen,
      ),
      body: SafeArea(
        child: BlocBuilder<UsersCubit, List<User>>(
          bloc: _usersCubit,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _pushScreen(state[index]),
                  child: Column(
                    children: [
                      Text(state[index].text1),
                      Text(state[index].text2),
                      Text(state[index].text3),
                      Text(state[index].text4),
                    ],
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
