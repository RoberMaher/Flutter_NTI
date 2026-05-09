// Exercise 3: Book Class
// Create a Book class with properties for title, author, and publicationYear. Implement a 
// method called printInfo that prints the book's information. Create two Book objects and 
// call the printInfo method for each.

class Book {
  String title;
  String author;
  int publicationYear;

  Book({
    required this.title,
    required this.author,
    required this.publicationYear,
  });

  void printInfo() {
    print('Title: $title');
    print('Author: $author');
    print('Publication Year: $publicationYear');
  }
}

