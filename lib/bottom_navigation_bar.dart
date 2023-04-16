import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/home_screen.dart';
import 'package:grocery_app/provider/dark_theme_provider.dart';
import 'package:grocery_app/screens/cart_screen.dart';
import 'package:grocery_app/screens/categories_screen.dart';
import 'package:grocery_app/screens/user_screen.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  BottomNavigationBarScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _index = 0;

  final List <Map<String , dynamic>> _screens = [
    {'page' : HomeScreen(), 'title':'Home Screen' },
    {'page' : CategoriesScreen(), 'title':'Categories Screen' },
    {'page' : CartScreen(), 'title':'Cart Screen' },
    {'page' : UserScreen(), 'title':'User Screen' },

  ];

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(_screens[_index]['title']),),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: themeState.getDarkTheme ? Theme.of(context).cardColor :Colors.white ,


        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.category_outlined), label: "Categories"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_outlined), label: "User"),
        ],
      ),
      body: _screens[_index]['page'],
    );
  }
}
