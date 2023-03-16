import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/style.dart';
import '../notification_screen/notification_screen.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Primary0,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Dashboard",
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Column(
            children: [
              Container(
                child: cards(),
              ),
              Container(
                child: ongoing_project(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cards() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Color(0xff6280FF),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Earnings",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.dollarSign,
                    color: Colors.white,
                  ),
                  Text(
                    "8,350",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Color(0xff375BE9),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "+10% since last month",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        Column(
          children: [
            Container(
              width: 180,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Color(0xffF3F6FD),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff375BE9)),
                    child: Center(
                      child: Text(
                        "98",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w300,
                            fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Rank",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "In top 30%",
                        style: TextStyle(
                            fontSize: 13, color: Colors.blueGrey[500]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Color(0xffF3F6FD),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Container(
                    width: 150,
                    child: Row(
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xff375BE9)),
                          child: Center(
                            child: Text(
                              "32",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Products",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "All tiime",
                              style: TextStyle(
                                  fontSize: 13, color: Colors.blueGrey[500]),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "shop",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "dosha",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 10),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget ongoing_project() {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "Products",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
                ),
                Spacer(),
                Text(
                  "See All",
                  style: TextStyle(
                      color: Color(0xff6280FF),
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
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
          )
        ],
      ),
    );
  }
}
