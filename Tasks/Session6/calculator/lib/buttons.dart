import 'package:calculator/button_values.dart';
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String value;
  final Color color;
  final VoidCallback onPressed;
  final Btn? btn;

  const CalculatorButton({
    super.key,
    required this.value,
    required this.color,
    required this.onPressed,
    this.btn,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        clipBehavior: Clip.antiAlias,
        shape: CircleBorder(),
        color: [Btn.del, Btn.clr, Btn.per].contains(value)
            ? Colors.blueGrey
            : [Btn.div, Btn.mul, Btn.sub, Btn.add, Btn.equ].contains(value)
            ? Colors.orange
            : color,
        child: InkWell(
          onTap: onPressed,
          child: Center(
            child: Text(
              value,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
