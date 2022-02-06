import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/presentation/presentation.dart';

class DeleteUser extends StatefulWidget {
  const DeleteUser({Key? key}) : super(key: key);

  @override
  _DeleteUserState createState() => _DeleteUserState();
}

class _DeleteUserState extends State<DeleteUser> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await context.read<FavoriteCubit>().removeUser();
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
    );
  }
}
