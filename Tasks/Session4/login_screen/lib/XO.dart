import 'package:flutter/material.dart';
import 'package:login_screen/board_button.dart';

class XoGame extends StatefulWidget {
  static const routeName = "/XoGame";

  const XoGame({super.key});

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  List<String> boardValues = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "XO GAME",
          style: TextStyle(
            color: Colors.blueAccent,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),

      body: Column(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(9, (index) {
              return BoardButton(
                value: boardValues[index],
                onBoerdButtonPressed: () => onBoerdButtonPressed(index),
              );
            }),
          ),
          Spacer(flex: 4),
        ],
      ),
    );
  }

  void onBoerdButtonPressed(int index) {
    if (boardValues[index].isEmpty) {
      setState(() {
        if (counter % 2 == 0) {
          boardValues[index] = "X";
        } else {
          boardValues[index] = "O";
        }
        counter++;
      });
    }
  }
}
