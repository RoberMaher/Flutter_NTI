import 'package:flutter/material.dart';

class InputLabel extends StatelessWidget {
  final String text;
  final IconData icon;
  const InputLabel({required this.text, required this.icon, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 30),
            Icon(icon, color: Colors.white, size: 15),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          children: [
            SizedBox(width: 30),
            Expanded(
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
      ],
    );
  }
}
