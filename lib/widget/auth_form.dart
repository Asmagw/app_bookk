import 'package:app_book/screen/auth_screen.dart';
import 'package:app_book/services/auth.dart';
import 'package:app_book/widget/orginal_button.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthForm extends StatefulWidget {
  AuthForm({super.key, required this.authType});
  final AuthType authType;
  AuthBase authBase = AuthBase();
  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  // ignore: unused_field
  final _formKey = GlobalKey<FormState>();
  // ignore: unused_field, prefer_final_fields
  String _email = '', _password = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              onChanged: (value) => _email = value,
              validator: (value) =>
                  value!.isEmpty ? 'ادخل ايميلك الجامعي' : null,
              decoration: const InputDecoration(
                  labelText: 'اكتب ايميلك الجامعي',
                  hintText: 'test@it.misuratau.edu.ly'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              onChanged: (value) => _password = value,
              validator: (value) => value!.length < 4
                  ? ' الرقم السري لابدا ان يكون اكبر من 4 ارقام '
                  : null,
              decoration: const InputDecoration(
                labelText: 'ادخل رقمك السري',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            OrginalButton(
              text: widget.authType == AuthType.login
                  ? ' ادخـــــل  '
                  : 'register',
              textColor: Colors.white,
              bgColor: const Color.fromARGB(255, 2, 93, 168),
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  if (widget.authType == AuthType.login) {
                    await AuthBase.loginWithEmailAndPassword(_email, _password);
                    Navigator.of(context).pushReplacementNamed('');
                  } else {
                    await AuthBase.registerWithEmailAndPassword(
                        _email, _password);
                    Navigator.of(context).pushReplacementNamed('');
                  }
                }
              },
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                if (AuthType == AuthType.login) {
                  Navigator.of(context).pushReplacementNamed('register');
                } else {
                  Navigator.of(context).pushReplacementNamed('login');
                }
              },
              child: Text(
                widget.authType == AuthType.login
                    ? 'هل لديك حساب؟ قم بالتسجيل'
                    : 'you have?',
                style: const TextStyle(
                  color: Colors.black54,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
