import 'package:coopa/users/screens/account_screen/constants/constants.dart';
import 'package:flutter/material.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.support_agent,
            size: 50,
            color: Colors.black54,
          ),
          SizedBox(width: 10),
          Text(
            "Feel Free to Ask, We Ready to Help",
            style: TextStyle(
              fontSize: ksmallFontSize,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
