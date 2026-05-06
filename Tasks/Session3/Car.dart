// Exercise 1: Creating a Class
// Create a Dart class called Car with properties for make, model, and year. Add a 
// constructor to initialize these properties. Then, create an object of the Car class and print 
// its details.

class Car {
  late String model;
  late int year;

  Car({required this. model ,required this. year}){
    print("Model of Car is :$model. And Year Of Creation is:$year ");
  }



}