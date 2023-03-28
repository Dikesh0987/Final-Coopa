import 'package:coopa/stores/screens/edit_account_details_screen/edit_account_details_screen.dart';
import 'package:coopa/stores/screens/get_in_touch_screen/get_in_touch_screen.dart';
import 'package:coopa/stores/screens/help_center_screen/help_center_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting {
  final String title;
  final String route;
  final IconData icon;
  final Route ontap;

  Setting({
    required this.ontap,
    required this.title,
    required this.route,
    required this.icon,
  });
}

final List<Setting> settings = [
  Setting(
      title: "Personal Data",
      route: "/edit_account",
      icon: CupertinoIcons.person_fill,
      ontap: MaterialPageRoute(builder: (context) => DetailEditPage())),
  Setting(
      title: "Settings",
      route: "/",
      icon: Icons.settings,
      ontap: MaterialPageRoute(builder: (_) => DetailEditPage())),
  Setting(
      title: "E-Statements",
      route: "/",
      icon: CupertinoIcons.doc_fill,
      ontap: MaterialPageRoute(builder: (_) => DetailEditPage())),
  Setting(
      title: "Refferal Code",
      route: "/",
      icon: CupertinoIcons.heart_fill,
      ontap: MaterialPageRoute(builder: (_) => DetailEditPage())),
];

final List<Setting> settings2 = [
  Setting(
      title: "Get IN out Touch",
      route: "/",
      icon: CupertinoIcons.ellipsis_vertical_circle_fill,
      ontap: MaterialPageRoute(builder: (_) => GetInTouchScreen())),
  Setting(
      title: "Help Center",
      route: "/",
      icon: CupertinoIcons.pencil_circle_fill,
      ontap: MaterialPageRoute(builder: (_) => HelpCenterScreen())),
  Setting(
      title: "Community",
      route: "/",
      icon: CupertinoIcons.person_3_fill,
      ontap: MaterialPageRoute(builder: (_) => DetailEditPage())),
  Setting(
      title: "Log Out",
      route: "/",
      icon: CupertinoIcons.person_3_fill,
      ontap: MaterialPageRoute(builder: (_) => DetailEditPage())),
];
