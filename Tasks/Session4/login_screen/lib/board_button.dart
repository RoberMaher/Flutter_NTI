import 'package:flutter/material.dart';

class BoardButton extends StatelessWidget {
  final String value;
  final void Function() onBoerdButtonPressed;

  const BoardButton({
    super.key,
    required this.value,
    required this.onBoerdButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onBoerdButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.amber,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: Text(value, style: TextStyle(color: Colors.blue, fontSize: 30)),
      ),
    );
  }
}
