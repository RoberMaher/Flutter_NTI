
// import 'Car.dart';
// import 'BankAccount.dart';
// import 'Rectangle.dart';
import 'Book.dart';

void main() {
  Book book1 = Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    publicationYear: 1960,
  );

  Book book2 = Book(
    title: '1984',
    author: 'George Orwell',
    publicationYear: 1949,
  );

  book1.printInfo();
  print('---');
  book2.printInfo();

  // Rectangle rectangle = Rectangle(lengh: 5, width: 10);
  // num area = rectangle.calculateArea();
  // print("The Area of Rectangle is: $area");
}
