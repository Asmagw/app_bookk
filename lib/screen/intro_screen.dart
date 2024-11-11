import 'package:app_book/widget/orginal_button.dart';
import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 172, 220, 235),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Image.asset('images/Reading.png'),
              OrginalButton(
                text: 'أهـــلا بــك',
                onPressed: () => Navigator.of(context).pushNamed('login'),
                textColor: Colors.white,
                bgColor: const Color.fromARGB(255, 1, 78, 141),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
