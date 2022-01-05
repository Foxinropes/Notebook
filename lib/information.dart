import 'package:flutter/material.dart';
import 'package:save_text_navig/screen.dart';

class Information extends StatefulWidget {
  const Information({this.texts, Key? key}) : super(key: key);

  final Texts? texts;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  Widget build(BuildContext context) {
    final texts = ModalRoute.of(context)!.settings.arguments as Texts;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 50,
            child: Text(texts.text1 ?? ''),
            // return Text(texts.text1 ?? '');
          ),
          Container(
            height: 50,
            child: Text(texts.text2 ?? ''),
            // return Text(texts.text2 ?? '');
          ),
          Container(
            height: 50,
            child: Text(texts.text3 ?? ''),
            // return Text(texts.text3 ?? '');
          ),
          Container(
            height: 50,
            child: Text(texts.text4 ?? ''),
            // return Text(texts.text4 ?? '');
          ),
        ],
      )),
    );
  }
}
