import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  static const String routeName = '/counter';
  CounterScreen({super.key});
  int counter = 0;
  String image1 = 'assets/Cars.jpg';
  String image2 = 'assets/Arts.jpg';

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Screen')
        ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (widget.counter == 4)
              Image.asset(widget.image1)
            else
              Image.asset(widget.image2),

            SizedBox(height: 90),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.counter++;
                });
              },
              child: const Icon(Icons.add, size: 50),
            ),
            SizedBox(height: 20),
            Text('${widget.counter}', style: const TextStyle(fontSize: 40)),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                setState(() {
                  widget.counter--;
                });
              },
              child: const Icon(Icons.remove, size: 50),
            ),
          ],
        ),
      ),
    );
  }
}
