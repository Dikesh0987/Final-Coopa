// Import necessary packages and files
import 'package:coopa/stores/screens/account_screen/settings_screen.dart';
import 'package:coopa/stores/screens/people_screen/people_screen.dart';
import 'package:coopa/stores/services/auth_apis.dart';
import 'package:coopa/theme/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../deshboard_screen/deshboard_screen.dart';
import '../home_screen/home_screen.dart';
import '../products_screen/products_screen.dart';

// Define the MainScreen widget
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// Define the MainScreen state
class _MainScreenState extends State<MainScreen> {
  // Initialize the state
  @override
  void initState() {
    super.initState();
    // Call the function to initialize all store data
    AuthAPI.getCurrentStoreInfo();
    // TODO: Call function to initialize store data
  }

  // Define the current index of the bottom navigation bar
  int _currentIndex = 0;

  // Define the list of screens to display in the bottom navigation bar
  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DashboardScreen(),
    ProductScreen(),
    PeopleScreen(),
    AccountScreen(
      store: AuthAPI.cInfo!,
    ),
  ];

  // Function to update the current index of the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Build the MainScreen widget
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // Define the body of the screen, which changes based on the selected screen
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      // Define the bottom navigation bar
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
            label: 'Dashboard',
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
