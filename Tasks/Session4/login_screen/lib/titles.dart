import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final String title1;
  final String title2;
  final String title3;
  const Titles({
    required this.title1,
    required this.title2,
    required this.title3,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
    
        SizedBox(width: 5),
    
        Icon(Icons.circle, color: Colors.white, size: 5),
    
        SizedBox(width: 5),
        Text(
          title2,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(width: 5),
    
        Icon(Icons.circle, color: Colors.white, size: 5),
    
        SizedBox(width: 5),
        Text(
          title3,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
