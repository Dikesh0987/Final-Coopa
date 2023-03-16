import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget implements PreferredSizeWidget {
  final double appBarHeight = 60.0;

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary0,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Coopa",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
              icon: const Icon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.black,
                size: 20,
              )),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotificationScreen()));
              },
              icon: const Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
                size: 20,
              )),
        ],
      ),
      body: const Center(
        child: Text("data"),
      ),
    );
  }
}
