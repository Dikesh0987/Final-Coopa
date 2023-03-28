import 'package:coopa/stores/screens/edit_account_details_screen/edit_account_details_screen.dart';
import 'package:coopa/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Coopa',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Welcome(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/edit_account': (context) => const DetailEditPage(),
      },
      );
  }
}
 