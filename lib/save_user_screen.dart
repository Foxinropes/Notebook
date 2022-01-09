import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:save_text_navig/save_user_cubit.dart';
import 'package:save_text_navig/user.dart';

class SaveUserScreen extends StatefulWidget {
  const SaveUserScreen({this.user, Key? key}) : super(key: key);

  final User? user;

  @override
  State<SaveUserScreen> createState() => _SaveUserScreenState();
}

class _SaveUserScreenState extends State<SaveUserScreen> {
  late TextEditingController _controller;
  late TextEditingController _controller2;
  late TextEditingController _controller3;
  late TextEditingController _controller4;
  late GlobalKey<FormState> _formKey;
  late final SaveUserCubit _saveUserCubit;

  @override
  void initState() {
    _saveUserCubit = SaveUserCubit(user: widget.user);
    _saveUserCubit.init();
    _controller = TextEditingController(text: widget.user?.text1 ?? '');
    _controller2 = TextEditingController(text: widget.user?.text2 ?? '');
    _controller3 = TextEditingController(text: widget.user?.text3 ?? '');
    _controller4 = TextEditingController(text: widget.user?.text4 ?? '');
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
    return Scaffold(
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
                  onPressed: _onButtonPressed,
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onButtonPressed() async {
    final isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      final text1 = _controller.text;
      final text2 = _controller2.text;
      final text3 = _controller3.text;
      final text4 = _controller4.text;

      final user = User(
        id: widget.user?.id,
        text1: text1,
        text2: text2,
        text3: text3,
        text4: text4,
      );

      _saveUserCubit.saveText(user);

      Navigator.pop(context);
    }
  }

  String? validator(String? text) {
    if (text?.isEmpty ?? true) {
      return 'Введите текст';
    }
  }
}
