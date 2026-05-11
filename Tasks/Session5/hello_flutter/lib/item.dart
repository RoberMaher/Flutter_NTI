import 'package:flutter/material.dart';

class Item extends StatelessWidget {
  final String imageUrl;
  final String title;
  const Item({super.key, required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        Image.asset(
          'assets/$imageUrl',
          fit: BoxFit.cover,
          height: 150,
          width: 350,
        ),

        // Container(
        //   decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage('assets/$imageUrl'),
        //       fit: BoxFit.fill,
        //     ),
        //   ),
        //   // height: 150,
        // ),
        Positioned(
          bottom: 8,
          right: 8,
          child: Container(
            color: Colors.deepPurpleAccent.withOpacity(0.5),
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
