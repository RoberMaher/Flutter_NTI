import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  const Button({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 300,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 30, 156, 150).withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
