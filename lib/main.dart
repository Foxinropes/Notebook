import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';
import 'utils/book_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UsersRepository().init();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = BookTheme.light();
    return BlocProvider(
      create: (context) => UsersCubit(),
      child: MaterialApp(
        theme: theme,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ru'),
        ],
        onGenerateRoute: (settings) {
          if (settings.name == '/saveUser') {
            final user = settings.arguments as User?;
            return MaterialPageRoute(
              builder: (context) => SaveUserScreen(
                user: user,
              ),
            );
          }
          return null;
        },
        routes: {
          '/': (context) => const UsersScreen(),
          '/favorite_user': (context) => const FavoriteUsersScreen(),
        },
      ),
    );
  }
}
