import 'dart:io';

// import 'Car.dart';
import 'BankAccount.dart';

void main(){
  // Car(model: "KIA", year: 2011);
  
  BankAccount account = BankAccount();

  print("Enter amount to deposit:");
  num amountForDeposit = num.parse(stdin.readLineSync()!);
  account.deposit(amountForDeposit);


  print("Enter amount to withdrow:");
  num amountForWithdrow = num.parse(stdin.readLineSync()!);
  account.withdrow(amountForWithdrow);

}