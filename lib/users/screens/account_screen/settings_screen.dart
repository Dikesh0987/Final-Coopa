import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/account_screen/model/model.dart';
import 'package:coopa/users/screens/account_screen/widgets/avatar_card.dart';
import 'package:coopa/users/screens/account_screen/widgets/setting_tile.dart';
import 'package:coopa/users/screens/account_screen/widgets/support_card.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Account",
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
              )),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(
          color: Colors.grey,
          width: .5,
        ))),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  const AvatarCard(),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(
                      settings.length,
                      (index) => SettingTile(setting: settings[index]),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Column(
                    children: List.generate(
                      settings2.length,
                      (index) => SettingTile(setting: settings2[index]),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SupportCard(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
