import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/favorite_cubit.dart';
import 'package:save_text_navig/user.dart';

class Favorite extends StatefulWidget {
  const Favorite({required this.user, Key? key}) : super(key: key);

  final User user;

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  late bool _isFavorited;
  late FavoriteCubit _favoriteCubit;

  @override
  void initState() {
    _isFavorited = widget.user.isFavorite;
    _favoriteCubit = FavoriteCubit(user: widget.user);
    super.initState();
  }

  @override
  void dispose() {
    _favoriteCubit.close();
    super.dispose();
  }

  void _changeFavorite() {
    _favoriteCubit.saveFavorite();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<FavoriteCubit, bool>(
      bloc: _favoriteCubit,
      listener: (context, state) {
        setState(() {
          _isFavorited = state;
        });
      },
      child: GestureDetector(
        onTap: _changeFavorite,
        child: _isFavorited
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
