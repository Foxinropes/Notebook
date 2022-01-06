import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/cubit.dart';
import 'package:save_text_navig/screen.dart';

class Information extends StatefulWidget {
  const Information(
      {
      // this.texts,
      Key? key})
      : super(key: key);

  // final Texts? texts;

  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {
  @override
  void initState() {
    context.read<RepositoryCubit>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<RepositoryCubit, User>(
          builder: (context, state) {
            return Column(
              children: [
                Container(
                  height: 50,
                  child: Text('${state.text1}'),
                  // return Text(texts.text1 ?? '');
                ),
                Container(
                  height: 50,
                  child: Text('${state.text2}'),
                  // return Text(texts.text2 ?? '');
                ),
                Container(
                  height: 50,
                  child: Text('${state.text3}'),
                  // return Text(texts.text3 ?? '');
                ),
                Container(
                  height: 50,
                  child: Text('${state.text4};'),
                  // return Text(texts.text4 ?? '');
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
