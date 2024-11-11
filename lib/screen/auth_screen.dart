import 'package:app_book/widget/auth_form.dart';
import 'package:flutter/material.dart';

enum AuthType { login, register }

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key, required this.authType});
  final AuthType authType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 1, 78, 141),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 60),
                  const Text(
                    'تسجيــل دخـــول',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  Image.asset(
                    'images/Reading.png',
                    height: 165,
                  ),
                ],
              )
            ],
          ),
          AuthForm(authType: authType),
        ],
      ),
    ));
  }
}
