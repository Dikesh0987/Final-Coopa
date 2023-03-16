import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/style.dart';

class OurCustomersScreen extends StatefulWidget {
  const OurCustomersScreen({super.key});

  @override
  State<OurCustomersScreen> createState() => _OurCustomersScreenState();
}

class _OurCustomersScreenState extends State<OurCustomersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Primary0,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Our customers",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
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
                    'Remove',
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
    );
  }
}
