import 'package:coopa/stores/screens/store_welcome_screen/store_welcome_screen.dart';
import 'package:coopa/stores/test.dart';
import 'package:coopa/users/screens/users_welcome_screen%20copy%203/users_welcome_screen.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Started'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Coopa',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Let\'s get started!',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Get Started'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => StoreWelcomeScreen()));
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Get Started'),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (_) => UsersWelcomeScreen()));
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Get Started'),
              onPressed: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
