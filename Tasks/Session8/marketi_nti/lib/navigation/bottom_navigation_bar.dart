import 'package:flutter/material.dart';
import 'package:marketi_nti/cart/cart_view.dart';
import 'package:marketi_nti/home/home_view.dart';
class BottomNavBar extends StatefulWidget {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    CartView(),
    Center(child: Text('Favorite')),
    Center(child: Text('Profile')),
  ];

  BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget._pages[widget._currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            widget._currentIndex = value;
          });
        },
        currentIndex: widget._currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
