import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/domain/domain.dart';
import 'package:save_text_navig/presentation/presentation.dart';
import 'package:save_text_navig/utils/constrains.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteUsersScreen extends StatefulWidget {
  const FavoriteUsersScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteUsersScreen> createState() => _FavoriteUsersScreenState();
}

class _FavoriteUsersScreenState extends State<FavoriteUsersScreen> {
  @override
  void initState() {
    context.read<UsersCubit>().getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          l10n!.favoriteUsers,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<UsersCubit, List<User>>(
          builder: (context, state) {
            final favoriteUsers =
                state.where((user) => user.isFavorite).toList();
            return Padding(
              padding: const EdgeInsets.only(top: AppConstrains.paddingMedium),
              child: ListView.builder(
                itemCount: favoriteUsers.length,
                itemBuilder: (context, index) {
                  return UserWidget(
                    user: favoriteUsers[index],
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
