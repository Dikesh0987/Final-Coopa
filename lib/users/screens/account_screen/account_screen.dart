import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/edit_account_details_screen/edit_account_details_screen.dart';
import 'package:coopa/users/screens/get_in_touch_screen/get_in_touch_screen.dart';
import 'package:coopa/users/screens/help_center_screen/help_center_screen.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _status = true;
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
          "Account Section",
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dikesh kumar netam",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "dikeshnetam0987@gmail.com",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Status (Online/Offline)",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              FlutterSwitch(
                                height: 20.0,
                                width: 40.0,
                                padding: 4.0,
                                toggleSize: 15.0,
                                borderRadius: 10.0,
                                activeColor: Colors.lightBlue,
                                value: _status,
                                onToggle: (value) {
                                  setState(() {
                                    _status = value;
                                  });
                                },
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "Account",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.circleInfo,
                        title: "Account details",
                        naviOnTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailEditPage()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.wrench,
                        title: "Store settings",
                        naviOnTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "Bonus point",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.globe,
                        title: "Sell your used product globely",
                        naviOnTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Text(
                          "More",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.circlePlay,
                        title: "Tutorials",
                        naviOnTap: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.handshakeAngle,
                        title: "Help center",
                        naviOnTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HelpCenterScreen()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.message,
                        title: "Get in touch",
                        naviOnTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GetInTouchScreen()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      _accountNaviList(
                        icon: FontAwesomeIcons.arrowRightFromBracket,
                        title: "Logout",
                        naviOnTap: () {},
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
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

class _accountNaviList extends StatefulWidget {
  _accountNaviList({
    Key? key,
    required this.icon,
    required this.title,
    required this.naviOnTap,
  }) : super(key: key);
  final IconData icon;
  final String title;
  void Function() naviOnTap;

  @override
  State<_accountNaviList> createState() => _accountNaviListState();
}

class _accountNaviListState extends State<_accountNaviList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.naviOnTap,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.black12,
          child: Icon(
            widget.icon,
            size: 20,
            color: Colors.black87,
          ),
          radius: 20,
        ),
        title: Text(
          widget.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
        trailing: Icon(
          FontAwesomeIcons.angleRight,
          size: 20,
        ),
      ),
    );
  }
}
