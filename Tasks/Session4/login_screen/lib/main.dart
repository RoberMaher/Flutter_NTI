import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(color: const Color.fromARGB(255, 18, 79, 94)),
            Column(
              children: [
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "MOMENTUM",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "GROWTH",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(width: 5),

                    Icon(Icons.circle, color: Colors.white, size: 5),

                    SizedBox(width: 5),
                    Text(
                      "HAPPENS",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),

                    Icon(Icons.circle, color: Colors.white, size: 5),

                    SizedBox(width: 5),
                    Text(
                      "TODAY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "SIGN IN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),

                SizedBox(height: 50),

                Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.email, color: Colors.white, size: 15),
                    SizedBox(width: 10),
                    Text(
                      "Enter your Email",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5),

                Row(
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),

                SizedBox(height: 30),

                Row(
                  children: [
                    SizedBox(width: 30),
                    Icon(Icons.lock, color: Colors.white, size: 15),
                    SizedBox(width: 10),
                    Text(
                      "Enter your Password",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 5),

                Row(
                  children: [
                    SizedBox(width: 30),
                    Expanded(
                      child: Container(
                        height: 1,
                        width: double.infinity,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 30),
                  ],
                ),

                SizedBox(height: 50),

                Positioned(
                  child: Container(
                  alignment: Alignment.center,
                    width: 300,
                    color: const Color.fromARGB(
                      255,
                      30,
                      156,
                      150,
                    ).withOpacity(0.5),
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
