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

