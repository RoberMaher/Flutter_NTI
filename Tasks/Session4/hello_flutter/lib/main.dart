import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 190,
                      color: const Color.fromARGB(255, 90, 39, 200),
                      child: Text(
                        'الاخبار',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 190,
                      color: const Color.fromARGB(255, 90, 39, 200),
                      child: Text(
                        'المجلات',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Politics.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة السياسة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Technology.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة التكنولوجيا',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Sports.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة الرياضة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Tourism.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة اللسياحة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Health.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة الصحة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Women.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة حواء',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Science.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة العلوم',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Cars.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة السيارات',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Cooking.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة الطبخ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Culture.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة الثقافة',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Economics.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          height: 150,
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة الاقتصاد',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    flex: 1,
                    child: Stack(
                      children: [
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/Arts.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            color: Colors.deepPurpleAccent.withOpacity(0.5),
                            child: Text(
                              'مجلة الفنون',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}