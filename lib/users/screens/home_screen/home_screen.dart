import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/theme/style.dart';
import 'package:coopa/users/model/user_model.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:coopa/users/services/apis.dart';
import 'package:coopa/users/widgets/shop_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.user});
  final UserModel user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: Primary0,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Primary0,
          elevation: 0,
          centerTitle: false,
          title: Text(
            "Coopa",
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
                )),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(5.0),
          child: StreamBuilder(
            stream: APIs.getAllStores(),
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
                    .map((e) => Store.fromJson(e.data()))
                    .toList();

                if (storeList.isNotEmpty) {
                  return ListView.builder(
                    itemCount: storeList.length,
                    padding: EdgeInsets.only(top: 5),
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ShopCard(store: storeList[index]);
                    },
                  );
                } else {
                  return Center(
                    child: Text(
                      "No Store found",
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                }
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}


// StreamBuilder(
//             stream: APIs.getAllStores(),
//             builder: (context, snapshot) {
//               if (snapshot.connectionState == ConnectionState.waiting ||
//                   snapshot.connectionState == ConnectionState.none) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               } else if (snapshot.hasError) {
//                 return Center(
//                   child: Text(
//                     "Error loading data",
//                     style: TextStyle(fontSize: 20),
//                   ),
//                 );
//               } else if (snapshot.hasData) {
//                 final storeList = snapshot.data!.docs
//                     .map((e) => Store.fromJson(e.data()))
//                     .toList();

//                 if (storeList.isNotEmpty) {
//                   return ListView.builder(
//                     itemCount: storeList.length,
//                     padding: EdgeInsets.only(top: 5),
//                     physics: BouncingScrollPhysics(),
//                     itemBuilder: (context, index) {
//                       return ShopCard(store: storeList[index]);
//                     },
//                   );
//                 } else {
//                   return Center(
//                     child: Text(
//                       "No Store found",
//                       style: TextStyle(fontSize: 20),
//                     ),
//                   );
//                 }
//               } else {
//                 return Container();
//               }
//             },
//           ),