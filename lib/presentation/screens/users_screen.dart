import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/utils/constrains.dart';

import '../../domain/domain.dart';
import '../presentation.dart';

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
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Notebook',
          style: Theme.of(context).textTheme.headline1,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.pushNamed(context, '/favorite_user');
              context.read<UsersCubit>().getUsers();
            },
            icon: Icon(
              Icons.favorite,
              color: Theme.of(context).colorScheme.primaryContainer,
              size: AppConstrains.iconSize,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _pushScreen(context),
      ),
      body: SafeArea(
        child: BlocBuilder<UsersCubit, List<User>>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: AppConstrains.paddingMedium),
              child: ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  return UserWidget(
                    user: state[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
