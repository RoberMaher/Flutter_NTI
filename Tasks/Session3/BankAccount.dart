// Exercise 2: Bank Account Class
// Define a BankAccount class with properties for accountNumber and balance. Include 
// methods for deposit and withdraw. Create two objects from the class, deposit and 
// withdraw funds, and print the account balances.

class BankAccount{
  late int accountNumber;
  num balance = 8000;

  void deposit(num amount){
        this.balance += amount;
        print("New Balance: $balance");
  }

  void withdrow(num amount){
    if (amount < this.balance){
        this.balance -= amount;
        print("New Balance: $balance");
    } 
    else
      print("Your Balance Not Enough");
  }

}