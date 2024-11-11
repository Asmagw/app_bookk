import 'package:app_book/screen/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFEEEEEE),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(25)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(25)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade500),
              borderRadius: BorderRadius.circular(25)),
        ),
      ),
      home: const IntroScreen(),
      routes: {
        //'home': (context) => (),
        'login': (context) => const AuthScreen(
              authType: AuthType.login,
            ),
        'register': (context) => const AuthScreen(
              authType: AuthType.register,
            ),
      },
    );
  }
}

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 159, 192, 202),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Image.asset('images/Reading.png'),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'login');
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    ' أهـــــلاً بــــك',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
