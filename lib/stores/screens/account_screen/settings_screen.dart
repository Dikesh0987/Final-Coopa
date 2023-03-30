import 'package:coopa/stores/screens/account_screen/widgets/avatar_card.dart';
import 'package:coopa/stores/screens/account_screen/widgets/setting_tile.dart';
import 'package:coopa/stores/screens/account_screen/widgets/support_card.dart';
import 'package:coopa/stores/screens/notification_screen/notification_screen.dart';
import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/account_screen/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key, required this.store}) : super(key: key);

  final Store store;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text(
          "Account",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotificationScreen(),
                ),
              );
            },
            icon: Icon(
              FontAwesomeIcons.bell,
              color: Colors.black,
              size: 20,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                AvatarCard(),
                SizedBox(height: 20),
                Column(
                  children: [
                    ...settings.map((setting) => SettingTile(setting: setting)),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    ...settings2
                        .map((setting) => SettingTile(setting: setting)),
                  ],
                ),
                SizedBox(height: 20),
                SupportCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
