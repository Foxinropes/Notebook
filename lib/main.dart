import 'package:flutter/material.dart';
import 'package:save_text_navig/favorite_icon.dart';
import 'package:save_text_navig/favorite_user_screen.dart';
import 'package:save_text_navig/save_user_screen.dart';
import 'package:save_text_navig/repository.dart';
import 'package:save_text_navig/user.dart';
import 'package:save_text_navig/users_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Repository().init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        if (settings.name == '/saveUser') {
          final user = settings.arguments as User?;
          return MaterialPageRoute(
            builder: (context) => SaveUserScreen(
              user: user,
            ),
          );
        }
      },
      routes: {
        '/': (context) => const UsersScreen(),
        '/favorite_user': (context) => const FavoriteUsersScreen(),
      },
    );
  }
}
