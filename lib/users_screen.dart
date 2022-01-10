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
        child: Icon(Icons.add),
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
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black38)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Имя: ${state[index].text1}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Фамилия: ${state[index].text2}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Отчество: ${state[index].text3}',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Возраст: ${state[index].text4}',
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
