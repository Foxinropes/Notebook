import 'package:flutter/material.dart';
import 'package:save_text_navig/information.dart';
import 'package:save_text_navig/screen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/navigation': (context) => Information(),
      },
      home: Screen(),
    );
  }
}
