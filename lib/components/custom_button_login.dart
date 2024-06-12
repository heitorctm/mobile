import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 15),
      ),
      onPressed: onPressed,
      child: Text(text,
          style: const TextStyle(
              color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 18)),
    );
  }
}