import 'package:coopa/users/screens/account_screen/constants/constants.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  const AvatarCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/camera.png",
              width: 60,
              height: 60,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Uranus Code",
                  style: TextStyle(
                    fontSize: kbigFontSize,
                    fontWeight: FontWeight.bold,
                    color: kprimaryColor,
                  ),
                ),
                Text(
                  "Youtube Channel",
                  style: TextStyle(
                    fontSize: ksmallFontSize,
                    color: Colors.grey.shade600,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
