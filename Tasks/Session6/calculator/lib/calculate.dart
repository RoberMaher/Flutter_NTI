import 'package:calculator/button_values.dart';

class Calculate {
  String number1 = "";
  String operator = "";
  String number2 = "";

  void input(String value) {
    // OPERATOR
    if ([Btn.add, Btn.sub, Btn.mul, Btn.div].contains(value)) {
      if (number1.isEmpty) return;
      operator = value;
      return;
    }

    // DOT
    if (value == Btn.dot) {
      if (operator.isEmpty) {
        if (number1.contains(".")) return;
        number1 = number1.isEmpty ? "0." : "$number1.";
      } else {
        if (number2.contains(".")) return;
        number2 = number2.isEmpty ? "0." : "$number2.";
      }
      return;
    }

    // NUMBERS
    if (operator.isEmpty) {
      number1 += value;
    } else {
      number2 += value;
    }
  }

  void clear() {
    number1 = "";
    operator = "";
    number2 = "";
  }

  void delete() {
    if (number2.isNotEmpty) {
      number2 = number2.substring(0, number2.length - 1);
    } else if (operator.isNotEmpty) {
      operator = "";
    } else if (number1.isNotEmpty) {
      number1 = number1.substring(0, number1.length - 1);
    }
  }

  void percentage() {
    if (operator.isNotEmpty || number1.isEmpty) return;
    final number = double.parse(number1);
    number1 = (number / 100).toString();
  }

  void changeSign() {
    // if no operator → work on number1
    if (operator.isEmpty) {
      if (number1.isEmpty) return;

      if (number1.startsWith("-")) {
        number1 = number1.substring(1); // -5 → 5
      } else {
        number1 = "-$number1"; // 5 → -5
      }
    }
    // if operator exists → work on number2
    else {
      if (number2.isEmpty) return;

      if (number2.startsWith("-")) {
        number2 = number2.substring(1);
      } else {
        number2 = "-$number2";
      }
    }
  }

  double calculate() {
    final num1 = double.parse(number1);
    final num2 = double.parse(number2);

    switch (operator) {
      case Btn.add:
        return num1 + num2;
      case Btn.sub:
        return num1 - num2;
      case Btn.mul:
        return num1 * num2;
      case Btn.div:
        if (num2 == 0) throw Exception("Cannot divide by zero");
        return num1 / num2;
      default:
        throw Exception("Invalid operator");
    }
  }

  String get display {
    if (number1.isEmpty && operator.isEmpty && number2.isEmpty) {
      return "";
    }
    return "$number1 $operator $number2";
  }
}
