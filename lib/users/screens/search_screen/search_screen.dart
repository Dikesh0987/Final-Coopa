import 'package:coopa/stores/model/product_model.dart';
import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:coopa/users/services/apis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Primary0,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Primary0,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Search",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: 20,
                )),
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
        body: ListView(
          padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
          children: <Widget>[
            Container(
              height: 110.0,
              width: double.infinity,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.all(10.0),
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35.0),
                              color: Colors.orange),
                          child: IconButton(
                            icon: Icon(Icons.add),
                            color: Colors.white,
                            onPressed: () {},
                          )),
                      SizedBox(height: 7.0),
                      Text('Add To',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                  SizedBox(width: 25.0),
                  listItem('assets/images/dm1.jpg', 'Chris', true),
                  SizedBox(width: 25.0),
                  listItem('assets/images/dm1.jpg', 'Hugh', false),
                  SizedBox(width: 25.0),
                  listItem('assets/images/dm1.jpg', 'Depp', false),
                  SizedBox(width: 25.0),
                  listItem('assets/images/dm1.jpg', 'Tom', false),
                ],
              ),
            ),
            StreamBuilder(
              stream: APIs.getAllProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    snapshot.connectionState == ConnectionState.none) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Error loading data",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                } else if (snapshot.hasData) {
                  final storeList = snapshot.data!.docs
                      .map((e) => Product.fromJson(e.data()))
                      .toList();

                  if (storeList.isNotEmpty) {
                    return ListView.builder(
                      itemCount: storeList.length,
                      padding: EdgeInsets.only(top: 5),
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Text("data");
                      },
                    );
                  } else {
                    return Center(
                      child: Text(
                        "No Products found",
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }
                } else {
                  return Container();
                }
              },
            ),
            SizedBox(height: 15.0),
            firstStyleRow('assets/images/dm1.jpg', 'assets/images/dm1.jpg',
                'assets/images/dm1.jpg'),
            SizedBox(height: 10.0),
            secondStyleRow('assets/images/dm1.jpg', 'assets/images/dm1.jpg',
                'assets/images/dm1.jpg'),
            SizedBox(height: 10.0),
            infoRow(),
            SizedBox(height: 15.0),
            firstStyleRow('assets/images/dm1.jpg', 'assets/images/dm1.jpg',
                'assets/images/dm1.jpg'),
            SizedBox(height: 10.0),
            secondStyleRow('assets/images/dm1.jpg', 'assets/images/dm1.jpg',
                'assets/images/dm1.jpg'),
            SizedBox(height: 10.0),
            infoRow(),
            SizedBox(height: 15.0),
            firstStyleRow('assets/images/dm1.jpg', 'assets/images/dm1.jpg',
                'assets/images/dm1.jpg'),
            SizedBox(height: 10.0),
            secondStyleRow('assets/images/dm1.jpg', 'assets/images/dm1.jpg',
                'assets/images/dm1.jpg'),
            SizedBox(height: 10.0),
            infoRow(),
          ],
        ));
  }

  Widget infoRow() {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
                width: (MediaQuery.of(context).size.width - 30.0) / 2,
                height: 100.0,
                child: Column(children: <Widget>[
                  Text(
                    'I like the way to place items to show more...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/dm1.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mona Hall',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.orange),
                            ),
                            Text(
                              '10:51PM',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Montserrat', color: Colors.grey),
                            ),
                          ],
                        ),
                      ])
                ])),
            SizedBox(width: 10.0),
            Container(
                width: (MediaQuery.of(context).size.width - 30.0) / 2,
                height: 100.0,
                child: Column(children: <Widget>[
                  Text(
                    'I like the way to place items to show more...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Montserrat'),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: AssetImage('assets/images/dm1.jpg'),
                                  fit: BoxFit.cover)),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Mona Hall',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  color: Colors.orange),
                            ),
                            Text(
                              '10:51PM',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: 'Montserrat', color: Colors.grey),
                            ),
                          ],
                        ),
                      ])
                ])),
          ],
        ));
  }

  Widget secondStyleRow(String imgPath1, String imgPath2, String avatarImg) {
    return Container(
      height: 250.0,
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 250.0,
            width: (MediaQuery.of(context).size.width - 30.0) / 2,
            child: Container(
              height: 250.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: AssetImage(imgPath2), fit: BoxFit.cover)),
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            height: 250.0,
            width: (MediaQuery.of(context).size.width - 30.0) / 2,
            child: Column(
              children: <Widget>[
                Text(
                  'I like the way to place items to show more...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                              image: AssetImage(avatarImg), fit: BoxFit.cover)),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Mona Hall',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.orange),
                        ),
                        Text(
                          '10:51PM',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Montserrat', color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 42.0),
                Container(
                  height: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage(imgPath1), fit: BoxFit.cover)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget firstStyleRow(String imgPath1, String imgPath2, String avatarImg) {
    return Container(
        height: 250.0,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: Row(children: [
          Container(
              height: 250.0,
              width: (MediaQuery.of(context).size.width - 30.0) / 2,
              child: Column(children: [
                Container(
                  height: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage(imgPath1), fit: BoxFit.cover)),
                ),
                SizedBox(height: 15.0),
                Text('I like the way to place Items to show more...',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Montserrat')),
                SizedBox(height: 15.0),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              image: DecorationImage(
                                  image: AssetImage(avatarImg)))),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Mona Hall',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Montserrat', color: Colors.orange),
                          ),
                          Text(
                            '10:51PM',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'Montserrat', color: Colors.grey),
                          ),
                        ],
                      )
                    ])
              ])),
          SizedBox(width: 10.0),
          Container(
              height: 250.0,
              width: (MediaQuery.of(context).size.width - 30.0) / 2,
              child: Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                          image: AssetImage(imgPath2), fit: BoxFit.cover))))
        ]));
  }

  Widget listItem(String imgPath, String name, bool available) {
    return Column(
      children: <Widget>[
        Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35.0),
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.cover)),
        ),
        SizedBox(height: 7.0),
        Row(
          children: <Widget>[
            Text(name,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600)),
            SizedBox(width: 4.0),
            available
                ? Container(
                    height: 10.0,
                    width: 10.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        color: Colors.orange),
                  )
                : Container()
          ],
        )
      ],
    );
  }
}
