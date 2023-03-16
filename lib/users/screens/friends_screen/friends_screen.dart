import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/all_users_screen/all_users_screen.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:coopa/users/screens/view_profile_screen/view_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary0,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Primary0,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AllUsersScreen()));
        },
        child: Icon(
          FontAwesomeIcons.searchengin,
          color: Colors.black,
          size: 24,
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Friends",
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
              icon: Icon(
                FontAwesomeIcons.bell,
                color: Colors.black,
                size: 20,
              ))
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  usersBox(
                    email: 'dikeshnetam0987@gmail.com',
                    name: 'Dikesh kumar netam',
                  ),
                  usersBox(
                    email: 'dikeshnetam0987@gmail.com',
                    name: 'Dikesh kumar netam',
                  ),
                ],
              ),
              Row(
                children: [
                  usersBox(
                    email: 'dikeshnetam0987@gmail.com',
                    name: 'Dikesh kumar netam',
                  ),
                  usersBox(
                    email: 'dikeshnetam0987@gmail.com',
                    name: 'Dikesh kumar netam',
                  ),
                ],
              ),
              Row(
                children: [
                  usersBox(
                    email: 'dikeshnetam0987@gmail.com',
                    name: 'Dikesh kumar netam',
                  ),
                  usersBox(
                    email: 'dikeshnetam0987@gmail.com',
                    name: 'Dikesh kumar netam',
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class usersBox extends StatelessWidget {
  const usersBox({
    super.key,
    required this.name,
    required this.email,
  });
  final String name, email;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ViewProfileScreen()));
          },
          child: Container(
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    name,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    email,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    minWidth: 100,
                    child: Text(
                      'Chat',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}