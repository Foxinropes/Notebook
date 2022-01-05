import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/cubit.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _controller = TextEditingController();
    _controller2 = TextEditingController();
    _controller3 = TextEditingController();
    _controller4 = TextEditingController();
    context.read<RepositoryCubit>().init();
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RepositoryCubit, Texts>(
      listener: (context, state) {
        setState(() {
          _controller.text = state.text1 ?? '';
          _controller2.text = state.text2 ?? '';
          _controller3.text = state.text3 ?? '';
          _controller4.text = state.text4 ?? '';
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Имя',
                    ),
                    controller: _controller,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Фамилия',
                    ),
                    controller: _controller2,
                  ),
                  TextFormField(
                    validator: validator,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Отчество',
                    ),
                    controller: _controller3,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'дата рождения',
                    ),
                    controller: _controller4,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final isValidated =
                          _formKey.currentState?.validate() ?? false;
                      if (isValidated) {
                        // pushWithArguments();
                        Navigator.pushNamed(context, '/navigation');
                        context.read<RepositoryCubit>().saveText(
                              _controller.text,
                              _controller2.text,
                              _controller3.text,
                              _controller4.text,
                            );
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void pushWithArguments() {
  //   final texts = Texts(
  //     _controller.text,
  //     _controller2.text,
  //     _controller3.text,
  //     _controller4.text,
  //   );
  //   Navigator.pushNamed(context, '/navigation', arguments: texts);
  // }

  String? validator(String? text) {
    if (text?.isEmpty ?? true) {
      return 'Введите текст';
    }
  }
}
