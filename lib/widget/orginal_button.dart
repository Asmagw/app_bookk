import 'package:flutter/material.dart';

class OrginalButton extends StatelessWidget {
  const OrginalButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.textColor,
      required this.bgColor});
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final Color bgColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
    );
  }
}
