import 'dart:io';

// import 'Car.dart';
// import 'BankAccount.dart';
import 'Rectangle.dart';

void main(){
  // Car(model: "KIA", year: 2011);
  
  // BankAccount account = BankAccount();

  // print("Enter amount to deposit:");
  // num amountForDeposit = num.parse(stdin.readLineSync()!);
  // account.deposit(amountForDeposit);


  // print("Enter amount to withdrow:");
  // num amountForWithdrow = num.parse(stdin.readLineSync()!);
  // account.withdrow(amountForWithdrow);

  Rectangle rectangle = Rectangle(lengh: 5, width: 10);
   num area = rectangle.calculateArea();
   print("The Area of Rectangle is: $area");

}