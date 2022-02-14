import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:save_text_navig/presentation/cubit/save_user_cubit.dart';
import 'package:save_text_navig/domain/entity/user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:save_text_navig/utils/constrains.dart';

class SaveUserScreen extends StatefulWidget {
  const SaveUserScreen({this.user, Key? key}) : super(key: key);

  final User? user;

  @override
  State<SaveUserScreen> createState() => _SaveUserScreenState();
}

class _SaveUserScreenState extends State<SaveUserScreen> {
  static const double _contentHeight = 320;
  static const double _buttonHeight = 40;

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
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            height: _contentHeight,
            padding: const EdgeInsets.symmetric(
              horizontal: AppConstrains.paddingMedium,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  focusNode: myFocusNode,
                  validator: validator,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: l10n?.firstName,
                  ),
                  controller: _controller,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  validator: validator,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: l10n?.lastName,
                  ),
                  controller: _controller2,
                ),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: l10n?.surName,
                  ),
                  controller: _controller3,
                ),
                TextFormField(
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  keyboardType: TextInputType.number,
                  maxLength: 2,
                  decoration: InputDecoration(
                    counterText: '',
                    border: const OutlineInputBorder(),
                    hintText: l10n?.age,
                  ),
                  controller: _controller4,
                ),
                GestureDetector(
                  onTap: _onButtonPressed,
                  child: Container(
                    height: _buttonHeight,
                    padding: const EdgeInsets.all(
                      AppConstrains.paddingMedium,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(
                        AppConstrains.borderRadius,
                      ),
                    ),
                    child: Text(
                      l10n!.save,
                      style: const TextStyle(
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
      return AppLocalizations.of(context)?.enterText;
    }
    return null;
  }
}
