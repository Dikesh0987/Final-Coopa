import 'package:coopa/theme/style.dart';
import 'package:coopa/users/helper/dailogs.dart';
import 'package:coopa/users/model/user_model.dart';
import 'package:coopa/users/screens/account_screen/constants/constants.dart';
import 'package:coopa/users/screens/account_screen/model/model.dart';
import 'package:coopa/users/screens/account_screen/widgets/avatar_card.dart';
import 'package:coopa/users/screens/account_screen/widgets/setting_tile.dart';
import 'package:coopa/users/screens/account_screen/widgets/support_card.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:coopa/users/services/apis.dart';
import 'package:coopa/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                        text: 'Welcome ',
                        style: TextStyle(
                          color: ksecondaryClr,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                              text: 'Dikesh',
                              style: TextStyle(
                                color: kblackClr,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ))
                        ]),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NotificationScreen()));
                        },
                        child: const CircleAvatar(
                          backgroundColor: klightGrayClr,
                          child: Icon(Icons.notifications_outlined,
                              color: kblackClr),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              AvatarCard(
                user: widget.user,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      Column(
                        children: [
                          ...settings.map((setting) => SettingTile(
                                setting: setting,
                                user: widget.user,
                              )),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          ...settings2.map((setting) => SettingTile(
                                setting: setting,
                                user: widget.user,
                              )),
                        ],
                      ),
                      GestureDetector(
                        onTap: () async {
                          APIs.updateActiveStatus(false);

                          // For showing progress bar ...
                          CustomDialog.showProgressDialog(context);
                          // Sign Out from app ...
                          await APIs.auth.signOut().then((value) async {
                            await GoogleSignIn().signOut().then((value) {
                              // For hideing progress ...
                              Navigator.pop(context);

                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Welcome()));
                            });
                          });
                        }, // Navigation
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              margin: const EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                color: klightContentColor,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Icon(
                                FontAwesomeIcons.arrowRightFromBracket,
                                color: Colors.black54,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "Log Out",
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: ksmallFontSize,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            Icon(
                              CupertinoIcons.chevron_forward,
                              color: Colors.grey.shade600,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      SupportCard(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
