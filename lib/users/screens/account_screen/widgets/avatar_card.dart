import 'package:coopa/stores/screens/account_screen/constants/constants.dart';
import 'package:coopa/users/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AvatarCard extends StatefulWidget {
  const AvatarCard({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  State<AvatarCard> createState() => _AvatarCardState();
}

class _AvatarCardState extends State<AvatarCard> {
  @override
  Widget build(BuildContext context) {
    bool tvalue = widget.user.isOnline;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                      widget.user.images,
                    ),
                    fit: BoxFit.cover),
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kprimaryColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.user.about,
                  style: TextStyle(
                    fontSize: ksmallFontSize,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Online/Offline",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(width: 15),
                    FlutterSwitch(
                      height: 20.0,
                      width: 40.0,
                      padding: 4.0,
                      toggleSize: 15.0,
                      borderRadius: 10.0,
                      activeColor: Colors.lightBlue,
                      value: tvalue,
                      onToggle: (value) {
                        setState(() {
                          tvalue = value;
                        });
                        // AuthAPI.storeStatus(widget.user, _tvalue);
                      },
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
