import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_screen/board_button.dart';
import 'package:login_screen/button.dart';

class XoGame extends StatefulWidget {
  static const routeName = "/XoGame";

  const XoGame({super.key});

  @override
  State<XoGame> createState() => _XoGameState();
}

class _XoGameState extends State<XoGame> {
  List<String> boardValues = ["", "", "", "", "", "", "", "", ""];
  int counter = 0;
  int xScore = 0;
  int oScore = 0;

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
          Spacer(flex: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Spacer(flex: 4),
              Column(
                children: [
                  Text(
                    "Player 1",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Score: $oScore",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              Spacer(flex: 4),
              Column(
                children: [
                  Text(
                    "Player 2",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "Score: $xScore",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ],
              ),
              Spacer(flex: 4),
            ],
          ),
          SizedBox(height: 20),
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
          Button(text: "Reset Score", onTap: () => resetScore(), color: Colors.red),
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
        checkWin();
      });
    }
  }

  bool checkWinner(String value) {
    for (int i = 0; i < 9; i += 3) {
      if (boardValues[i] == value &&
          boardValues[i + 1] == value &&
          boardValues[i + 2] == value) {
        return true;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (boardValues[i] == value &&
          boardValues[i + 3] == value &&
          boardValues[i + 6] == value) {
        return true;
      }
    }
    if (boardValues[0] == value &&
        boardValues[4] == value &&
        boardValues[8] == value) {
      return true;
    }
    if (boardValues[2] == value &&
        boardValues[4] == value &&
        boardValues[6] == value) {
      return true;
    }
    return false;
  }

  void showWinner(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Game Over"),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: Text("Play Again"),
            ),
          ],
        );
      },
    );
  }

  void checkWin() {
    if (checkWinner("X")) {
      showWinner("X wins");
      xScore++;
    } else if (checkWinner("O")) {
      showWinner("O wins");
      oScore++;
    } else if (counter == 9) {
      showWinner("Draw");
    }
  }

  void resetGame() {
    setState(() {
      boardValues = List.filled(9, "");
      counter = 0;
    });
  }

  void resetScore() {
    setState(() {
      xScore = 0;
      oScore = 0;
    });
  }
}
