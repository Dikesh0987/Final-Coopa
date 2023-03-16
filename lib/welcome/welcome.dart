import 'package:coopa/stores/screens/store_welcome_screen/store_welcome_screen.dart';
import 'package:coopa/users/screens/users_welcome_screen%20copy%203/users_welcome_screen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("welcome"),
        ),
        body: SafeArea(
            child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StoreWelcomeScreen()));
              },
              child: Text("store"),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => UsersWelcomeScreen()));
              },
              child: Text("user"),
            ),
          ],
        )));
  }
}
