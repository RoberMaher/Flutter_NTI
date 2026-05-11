import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: const Color.fromARGB(255, 90, 39, 200),
            child: Text(
              'الاخبار',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
        ),
        SizedBox(width: 5),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 50,
            color: const Color.fromARGB(255, 90, 39, 200),
            child: Text(
              'المجلات',
              style: TextStyle(color: Colors.white, fontSize: 26),
            ),
          ),
        ),
      ],
    );
  }
}
