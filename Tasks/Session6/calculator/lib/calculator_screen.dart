import 'package:calculator/button_values.dart';
import 'package:calculator/buttons.dart';
import 'package:calculator/calculate.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final Calculate calc = Calculate();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculator')),
      body: SafeArea(
        child: Column(
          children: [
            //Output
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                child: Container(
                  alignment: Alignment.bottomRight,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    calc.display.isEmpty ? "0" : calc.display,
                    style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.end,
                  ),
                ),
              ),
            ),

            //Buttons
            Wrap(
              children: Btn.button_values
                  .map(
                    (btn) => SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.width / 5,
                      child: CalculatorButton(
                        value: btn,
                        color: Colors.grey[850]!,
                        onPressed: () {
                          setState(() {
                            if (btn == Btn.clr) {
                              calc.clear();
                            } else if (btn == Btn.del) {
                              calc.delete();
                            } else if (btn == Btn.per) {
                              calc.percentage();
                            } else if (btn == Btn.equ) {
                              final result = calc.calculate();
                              calc.number1 = result.toString();
                              calc.operator = "";
                              calc.number2 = "";
                            } else if (btn == Btn.sign) {
                              setState(() {
                                calc.changeSign();
                              });
                            } else {
                              calc.input(btn);
                            }
                          });
                        },
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
