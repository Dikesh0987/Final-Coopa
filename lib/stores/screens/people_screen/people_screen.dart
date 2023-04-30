
import 'package:coopa/stores/screens/account_screen/model/model.dart';
import 'package:coopa/stores/services/auth_apis.dart';
import 'package:coopa/theme/style.dart';
import 'package:coopa/users/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../notification_screen/notification_screen.dart';
import '../people_profile_screen/people_profile_screen.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // for all connections
    List<String> connList = [];

    // for all users ..
    List<UserModel> list = [];

    return Scaffold(
      backgroundColor: klightGrayClr,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: klightGrayClr,
        elevation: 0,
        centerTitle: false,
        title: Text(
          "Connections",
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
      body: SafeArea(
        child: StreamBuilder(
          stream: AuthAPI.getAllStoreConn(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              // if data has been loading
              case ConnectionState.waiting:
              case ConnectionState.none:
                return Center(
                  child: CircularProgressIndicator(),
                );

              // data lodede

              case ConnectionState.active:
              case ConnectionState.done:
                final data = snapshot.data?.docs;
                connList = data?.map((e) => e.id).toList() ?? [];

                print(connList);

                if (connList.isNotEmpty) {
                  return StreamBuilder(
                    stream: AuthAPI.getSalectedUserData(connList),
                    builder: (context, snapshot) {
                      switch (snapshot.connectionState) {
                        // if data has been loading
                        case ConnectionState.waiting:
                        case ConnectionState.none:
                          return Center(
                            child: CircularProgressIndicator(),
                          );

                        // data lodede

                        case ConnectionState.active:
                        case ConnectionState.done:
                          final data = snapshot.data?.docs;
                          list = data
                                  ?.map((e) => UserModel.fromJson(e.data()))
                                  .toList() ??
                              [];

                          if (list.isNotEmpty) {
                            return ListView.builder(
                                itemCount: list.length,
                                padding: EdgeInsets.only(top: 5),
                                physics: BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return usersBox(
                                    user: list[index],
                                  );
                                });
                          } else {
                            return Center(
                              child: Text(
                                "No Data Found",
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          }
                      }
                    },
                  );
                } else {
                  return Text("datda");
                }
            }
          },
        ),
      ),
    );
  }
}

class usersBox extends StatelessWidget {
  const usersBox({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfilePage(
                          user: user,
                        )));
          },
          child: Container(
            height: 240,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.name,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.email,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    minWidth: 100,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))),
                    onPressed: () async {
                      await AuthAPI.dropConnections(store!);
                    },
                    child: Text(
                      'Kick Out',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
