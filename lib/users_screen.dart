import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/favorite_icon.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/user_widget.dart';
import 'package:save_text_navig/users_cubit.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().getUsers();
    super.initState();
  }

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
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/favorite_user');
              context.read<UsersCubit>().getUsers();
            },
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _pushScreen(context),
      ),
      body: SafeArea(
        child: BlocBuilder<UsersCubit, List<User>>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.length,
              itemBuilder: (context, index) {
                return UserWidget(
                  user: state[index],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
