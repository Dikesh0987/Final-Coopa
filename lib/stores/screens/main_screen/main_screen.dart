import 'package:coopa/stores/screens/account_screen/account_screen.dart';
import 'package:coopa/stores/screens/people_screen/people_screen.dart';
import 'package:coopa/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../deshboard_screen/deshboard_screen.dart';
import '../home_screen/home_screen.dart';
import '../products_screen/products_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DashboardScreen(),
    ProductScreen(),
    PeopleScreen(),
    AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Primary0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.graph_circle),
            label: 'Deshboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.collections),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: 'People',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
