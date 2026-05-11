import 'package:flutter/material.dart';
import 'package:hello_flutter/CustomAppBar.dart';
import 'package:hello_flutter/item.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Item> items = [
    Item(imageUrl: "Politics.jpg", title: " مجلة السياسة"),
    Item(imageUrl: "Technology.jpg", title: " مجلة التكنولوجيا"),
    Item(imageUrl: "Sports.jpg", title: "مجلة الرياضة"),
    Item(imageUrl: "Tourism.jpg", title: "مجلة السياحة"),
    Item(imageUrl: "Health.jpg", title: "مجلة الصحة"),
    Item(imageUrl: "Women.jpg", title: "مجلة حواء"),
    Item(imageUrl: "Science.png", title: "مجلة العلوم"),
    Item(imageUrl: "Cars.jpg", title: "مجلة السيارات"),
    Item(imageUrl: "Cooking.jpg", title: "مجلة الطبخ"),
    Item(imageUrl: "Culture.jpg", title: "مجلة الثقافة"),
    Item(imageUrl: "Economics.jpg", title: "مجلة الاقتصاد"),
    Item(imageUrl: "Arts.jpg", title: "مجلة الفنون"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(),

          Expanded(
            child: GridView.builder(
              itemCount: items.length,
              padding: EdgeInsets.only(top: 5),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 570 / 350,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
              ),
              itemBuilder: (context, index) {
                return Item(
                  imageUrl: items[index].imageUrl,
                  title: items[index].title,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
