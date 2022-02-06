import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/domain/entity/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:save_text_navig/utils/constrains.dart';

import '../presentation.dart';

class UserWidget extends StatelessWidget {
  const UserWidget({
    required this.user,
    Key? key,
  }) : super(key: key);

  final User user;

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
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (context) => FavoriteCubit(
        usersCubit: BlocProvider.of<UsersCubit>(context),
        user: user,
      ),
      child: GestureDetector(
        onTap: () => _pushScreen(context, user),
        child: Container(
          padding: const EdgeInsets.all(
            AppConstrains.paddingMedium,
          ),
          margin: const EdgeInsets.all(AppConstrains.paddingMedium),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(AppConstrains.borderRadius),
            border: Border.all(
                color: Theme.of(context).colorScheme.secondary,
                width: AppConstrains.borderWidth),
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _UserCredentialsText(
                    '${l10n.firstName}: ${user.text1}',
                  ),
                  _UserCredentialsText(
                    '${l10n.lastName}: ${user.text2}',
                  ),
                  _UserCredentialsText(
                    '${l10n.surName}: ${user.text3}',
                  ),
                  _UserCredentialsText(
                    '${l10n.age}: ${user.text4}',
                  ),
                ],
              ),
              const Expanded(
                child: SizedBox(),
              ),
              Favorite(
                isFavorite: user.isFavorite,
              ),
              const DeleteUser(),
            ],
          ),
        ),
      ),
    );
  }
}

class _UserCredentialsText extends StatelessWidget {
  const _UserCredentialsText(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
