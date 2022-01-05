import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/cubit.dart';
import 'package:save_text_navig/screen.dart';
import 'package:save_text_navig/information.dart';
import 'package:save_text_navig/repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Repository().init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RepositoryCubit(),
      child: MaterialApp(
        // onGenerateRoute: (settings) {
        //   if (settings.name == '/navigation') {
        //     return MaterialPageRoute(
        //       builder: (context) =>
        //           Information(texts: settings.arguments as Texts),
        //     );
        //   }
        // },
        routes: {
          '/': (context) => FirstScreen(),
          '/navigation': (context) => Information(),
        },
      ),
    );
  }
}
