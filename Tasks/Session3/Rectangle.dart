// Exercise 4: Rectangle Class
// Define a Rectangle class with properties for length and width. Add a method called 
// calculateArea that returns the area of the rectangle. Create a Rectangle object and 
// calculate its area.

class Rectangle{
  num lengh;
  num width;

  Rectangle({required this.lengh , required this.width});

  num calculateArea(){
    return lengh * width;
  }

}