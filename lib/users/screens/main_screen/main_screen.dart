import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/account_screen/account_screen.dart';
import 'package:coopa/users/screens/home_screen/home_screen.dart';
import 'package:coopa/users/screens/view_product_screen/view_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text("ds"),
    // ViewProductScreen(),
    // FriendsScreen(),
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
        iconSize: 20,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.store),
            label: 'Radar',
          ),

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.percent),
            label: 'Offers',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(FontAwesomeIcons.userGroup),
          //   label: 'Friends',
          // ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}
