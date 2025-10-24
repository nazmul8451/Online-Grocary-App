import 'package:flutter/material.dart';
import 'package:online_grocery_app/Ui/screens/home_screen.dart';
class BotomNavBar extends StatefulWidget {
  const BotomNavBar({super.key});

  static const String name = '/bottomNavBar';
  @override
  State<BotomNavBar> createState() => _BotomNavBarState();
}

class _BotomNavBarState extends State<BotomNavBar> {

  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text('Search Page')),
    Center(child: Text('Profile Page')),
    Center(child: Text('Explore')),
    Center(child: Text('Account')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
        color: Colors.white, // BottomNavBar-এর ব্যাকগ্রাউন্ড রঙ
        borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
    ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // হালকা ছায়া
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
            topRight: Radius.circular(20),),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
              currentIndex:_currentIndex ,
            selectedItemColor: Colors.green,
            unselectedItemColor: Colors.black,
            onTap:(index){
                setState(() {
                  _currentIndex = index;
                });
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_sharp),
                label: 'Shop',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.manage_search_outlined),
                label: 'Explore',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart_outlined),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
                label: 'Favourite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined),
                label: 'Account',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
