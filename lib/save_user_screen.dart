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
  late FocusNode myFocusNode;

  @override
  void initState() {
    _saveUserCubit = SaveUserCubit(user: widget.user);
    _saveUserCubit.init();
    _controller = TextEditingController(text: widget.user?.text1 ?? '');
    _controller2 = TextEditingController(text: widget.user?.text2 ?? '');
    _controller3 = TextEditingController(text: widget.user?.text3 ?? '');
    _controller4 = TextEditingController(text: widget.user?.text4 ?? '');
    _formKey = GlobalKey<FormState>();
    myFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    myFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: 320,
            padding: EdgeInsets.only(left: 7, right: 7),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Имя',
                  ),
                  controller: _controller,
                ),
                TextField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Фамилия',
                  ),
                  controller: _controller2,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  focusNode: myFocusNode,
                  validator: validator,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Отчество',
                  ),
                  controller: _controller3,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  maxLengthEnforced: true,
                  decoration: InputDecoration(
                    counterText: '',
                    border: OutlineInputBorder(),
                    hintText: 'Возраст',
                  ),
                  controller: _controller4,
                ),
                GestureDetector(
                  onTap: _onButtonPressed,
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.all(7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
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
      myFocusNode.requestFocus();
      return 'Введите текст';
    }
  }
}
