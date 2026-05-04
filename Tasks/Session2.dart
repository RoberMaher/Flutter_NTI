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

// // Task2
// void main(){
//   print("Geuss the number between 1 to 100")
//   Random random = Random();
//   int target = random.nextInt(100)+1;

//   while(guess != target){

//   }
//   }
void main(){
  List <int> numbers = [1, 2, 3, 4, 5];

  for (int number in numbers) {
    print(number + 1);
  }
}