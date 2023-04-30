import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../theme/style.dart';

class MakeYourBrandScreen extends StatelessWidget {
  const MakeYourBrandScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klightGrayClr,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: klightGrayClr,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Make own brand",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                FontAwesomeIcons.xmark,
                color: Colors.black,
                size: 20,
              ))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xffE0E5F1)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Image(
                              height: 60,
                              width: 60,
                              image: AssetImage(
                                "assets/images/camera.png",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Netam computer",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Badagaon vishrsmp",
                                style: TextStyle(
                                  color: Colors.blueGrey[200],
                                  height: 2,
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(7),
                            decoration: BoxDecoration(
                              color: Color(0xff13C6C2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "view",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          "our team suggest and give daily/weekly task for grow your bussiness.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color(0xffF3F6FD),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.indianRupeeSign,
                                  color: Colors.blueGrey[100],
                                ),
                                Text(
                                  "1,50",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.black),
                                ),
                                Text(
                                  "/month",
                                  style: TextStyle(height: 2),
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Color(0xff375BE9),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Text(
                                "Go now",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
