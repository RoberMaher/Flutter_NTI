import 'dart:io';
import 'dart:math';

// Task1
// void main(){
//   print("Enter the Number:");
//   int num = int.parse(stdin.readLineSync()!);

//   for(int i=1 ; i<11 ; i++){
//     print("$i x $num = ${i * num}" );
//   }
// }

// Task2
// void main(){
//   print("Geuss the number between 1 to 100")
//   Random random = Random();
//   int target = random.nextInt(100)+1;

//   while(guess != target){

//   }
//   }

// Task3
// void main(){
//   List <int> numbers = [1, 2, 3, 4, 5];

//   for (int number in numbers) {
//     print(number + 1);
//   }
// }

// Task4
// void main(){
//   void greet(String name){
//     print("Hello $name");
//   }

//   print("Enter your name:");
//   String? name = stdin.readLineSync();

//   greet(name!);
// }

// Task5
// void main() {
//   int add(int a, int b) {
//     return a + b;
//   }

//   int sub(int a, int b) {
//     return a - b;
//   }

//   int mul(int a, int b) {
//     return a * b;
//   }

//   double div(int a, int b) {
//     return a / b;
//   }
//   print("Enter first number:");
//   int num1 = int.parse(stdin.readLineSync()!);

//   print("Enter second number:");
//   int num2 = int.parse(stdin.readLineSync()!);

//   print("Addition: ${add(num1, num2)}");
//   print("Subtraction: ${sub(num1, num2)}");
//   print("Multiplication: ${mul(num1, num2)}");

//   if (num2 != 0) {
//     print("Division: ${div(num1, num2)}");
//   } else {
//     print("Cannot divide by zero");
//   }
// }

// Task6
// void main(){
//   num celsiusToFahrenheit(num temp){
//     return (temp * 9/5) + 32;
//   }

//   num fahrenheitToCelsius(num temp){
//     return (temp - 32) * 5 / 9;
//   }

//   print("Enter temperature value:");
//   num temp = num.parse(stdin.readLineSync()!);

//   print("Choose conversion:");
//   print("1 - Celsius to Fahrenheit");
//   print("2 - Fahrenheit to Celsius");

//   int choice = int.parse(stdin.readLineSync()!);

//   switch(choice){
//     case 123:
//         num result = celsiusToFahrenheit(temp);
//         print("Result: $temp °C = $result °F");
//         break;
    
//     case 2:
//         num result = fahrenheitToCelsius(temp);
//         print("Result: $temp °F = $result °C");

//     default:
//         print("Invalid choice!");

//   }
// }



void main() {

    double calculateArea(String shape,{double? side, double? length, double? width, double? radius}) {

        switch (shape) {
            case "square":
            return side! * side;

            case "rectangle":
            return length! * width!;

            case "circle":
            return pi * radius! * radius;

            default:
            return 0.0;
        }
    }

  print("Choose a shape (square, rectangle, circle):");
  String shape = stdin.readLineSync()!;

  double area = 0.0;

  switch (shape) {
    case "square":
      print("Enter side length:");
      double side = double.parse(stdin.readLineSync()!);
      area = calculateArea("square", side: side);
      break;

    case "rectangle":
      print("Enter length:");
      double length = double.parse(stdin.readLineSync()!);

      print("Enter width:");
      double width = double.parse(stdin.readLineSync()!);

      area = calculateArea("rectangle", length: length, width: width);
      break;

    case "circle":
      print("Enter radius:");
      double radius = double.parse(stdin.readLineSync()!);

      area = calculateArea("circle", radius: radius);
      break;

    default:
      print("Invalid shape");
      return;
  }

  print("Area of $shape is $area");
}