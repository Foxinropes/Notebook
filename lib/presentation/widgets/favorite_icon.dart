import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/presentation/presentation.dart';

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
        padding: const EdgeInsets.all(8),
        child: isFavorite
            ? Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.primaryContainer,
              )
            : Icon(
                Icons.favorite_border,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
      ),
    );
  }
}
