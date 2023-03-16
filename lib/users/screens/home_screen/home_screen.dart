import 'package:coopa/users/components/storelist.dart';
import 'package:coopa/users/constants/colors.dart';
import 'package:coopa/users/constants/fontsizes.dart';
import 'package:coopa/users/models/storelistmodel.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:coopa/users/screens/restaurant_list_screen/restaurant_list_screen.dart';
import 'package:coopa/users/screens/restaurant_menu_screen/restaurant_menu_screen.dart';
import 'package:coopa/users/screens/store_products_screen/store_products_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
            headerSliverBuilder: (context, isScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  elevation: 0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: primary,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Kendri",
                            style: TextStyle(
                                color: primary, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  centerTitle: false,
                  actions: [
                    CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          NotificationScreen()));
                            },
                            icon: Icon(
                              Icons.notifications_on_outlined,
                              color: Colors.black,
                            ),
                          )),
                    ),
                  ],
                )
              ];
            },
            body: DefaultTabController(
              length: 2,
              child: Scaffold(
                  appBar: const TabBar(
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 2,
                    tabs: [
                      Tab(
                        child: Text(
                          "Restaurant",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: tebTextFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Tab(
                        child: Text(
                          "Store's",
                          style: TextStyle(
                              color: textBlack,
                              fontSize: tebTextFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                    indicatorColor: primary,
                  ),
                  body: TabBarView(children: [
                    RestaurantListScreen(),
                    Container(
                      color: light,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            new ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: StoresLists.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                StoreProductScreen(
                                                  image:
                                                      StoresLists[index].image,
                                                  name:
                                                      StoresLists[index].title,
                                                )));
                                  },
                                  child: StoreListWidget(
                                      img: StoresLists[index].image,
                                      location: StoresLists[index].category,
                                      name: StoresLists[index].title,
                                      rating: StoresLists[index].price),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ])),
            )),
      ),
    );
  }

  Widget restaurantsTabs(
      String address, String name, String dish, String diatance) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
        padding: EdgeInsets.only(right: 20.0),
        child: GestureDetector(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => RestaurantMenuScreen(
                    image: "s",
                    name: "d",
                  ))),
          child: Container(
            width: width / 2.4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120.0,
                  width: width / 2.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      image: DecorationImage(
                          image: NetworkImage(address), fit: BoxFit.cover)),
                ),
                //name of the dish
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "$dish - $diatance - \$-10",
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  Widget pizzaTabs(String title, String no, String assetimage) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Container(
        height: 170.0,
        width: width / 3.3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Color.fromRGBO(255, 248, 230, 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text("$no restaurants", style: TextStyle(color: Colors.grey)),
            SizedBox(
              height: 10.0,
            ),
            Image(
              image: AssetImage(assetimage),
              height: 80.0,
              width: 80.0,
            )
          ],
        ),
      ),
    );
  }
}
