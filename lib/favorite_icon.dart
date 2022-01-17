import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/favorite_cubit.dart';

class Favorite extends StatelessWidget {
  const Favorite({required this.isFavorite, Key? key}) : super(key: key);

  final bool isFavorite;

  void _changeFavorite(BuildContext context) async {
    await BlocProvider.of<FavoriteCubit>(context).saveFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _changeFavorite(context),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: isFavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.red,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
      ),
    );
  }
}
