import 'package:coopa/stores/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashProductCard extends StatefulWidget {
  const DashProductCard({super.key});

  // final Product? product;

  @override
  State<DashProductCard> createState() => _DashProductCardState();
}

class _DashProductCardState extends State<DashProductCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        height: 80,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Color(0xff6280FF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              child: Icon(
                FontAwesomeIcons.slackHash,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mufti T-Shirt",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Text(
                  "555",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color(0xff375BE9),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                "View",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
