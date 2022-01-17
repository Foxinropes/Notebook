import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:save_text_navig/favorite_cubit.dart';

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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: const Icon(
          Icons.delete,
          color: Colors.black,
        ),
      ),
    );
  }
}
