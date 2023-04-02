import 'package:coopa/users/screens/feed_screen/feed_screen.dart';
import 'package:coopa/users/screens/home_screen/home_screen.dart';
import 'package:coopa/users/screens/account_screen/settings_screen.dart';
import 'package:coopa/users/screens/offers_screen/offers_screen.dart';
import 'package:coopa/users/screens/search_screen/search_screen.dart';
import 'package:coopa/users/services/apis.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Initialize the state
  @override
  void initState() {
    super.initState();
    // Call the function to initialize all store data
    APIs.getCurrentUserInfo();
    // TODO: Call function to initialize store data
  }

  // Define the current index of the bottom navigation bar
  int _currentIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(user: APIs.uInfo!,),
    FeedScreen(),
    SearchScreen(),
    // OffersScreen(),
    AccountScreen(
      user: APIs.uInfo!,
    ),
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
        backgroundColor: Colors.white,
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
            icon: Icon(FontAwesomeIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.rss),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.magnifyingGlass),
            label: 'Search',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(FontAwesomeIcons.percent),
          //   label: 'Offers',
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
