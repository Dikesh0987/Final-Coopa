import 'package:coopa/users/constants/colors.dart';
import 'package:coopa/users/constants/fontsizes.dart';
import 'package:coopa/users/constants/padding.dart';
import 'package:coopa/users/data/store_json.dart';
import 'package:coopa/users/screens/restaurant_menu_screen/restaurant_menu_screen.dart';
import 'package:coopa/users/widgets/dish_card.dart';
import 'package:coopa/users/widgets/store_card.dart';
import 'package:flutter/material.dart';


class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Special Offers",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(storeItems.length, (index) {
                        var store = storeItems[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestaurantMenuScreen(
                                              image: storeList[index]['image'],
                                              name: storeList[index]['name'],
                                            )));
                              },
                              child: Container(
                                child: StoreCard(width: 280, store: store),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RestaurantMenuScreen(
                                            image: storeList[index]['image'],
                                            name: storeList[index]['name'],
                                          )));
                            },
                            child: Container(
                              child: StoreCard(width: 280, store: store),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: topMainPadding, bottom: bottomMainPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: leftMainPadding, right: rightMainPadding),
                    child: Text(
                      "Recommeded Dishes",
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          List.generate(recommendedDishes.length, (index) {
                        var dishes = recommendedDishes[index];
                        if (index == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                left: leftMainPadding, right: rightMainPadding),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            RestaurantMenuScreen(
                                              image: storeList[index]['image'],
                                              name: storeList[index]['name'],
                                            )));
                              },
                              child: Container(
                                child: DishCard(width: 180, dish: dishes),
                              ),
                            ),
                          );
                        }
                        return Padding(
                          padding:
                              const EdgeInsets.only(right: rightMainPadding),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          RestaurantMenuScreen(
                                            image: storeList[index]['image'],
                                            name: storeList[index]['name'],
                                          )));
                            },
                            child: Container(
                              child: DishCard(width: 180, dish: dishes),
                            ),
                          ),
                        );
                      }),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(color: light),
            child: Padding(
              padding: const EdgeInsets.all(mainPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: List.generate(storeList.length, (index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(bottom: bottomMainPadding),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => RestaurantMenuScreen(
                                          image: storeList[index]['image'],
                                          name: storeList[index]['name'],
                                        )));
                          },
                          child: Container(
                            child: StoreCard(
                                width: size.width - (mainPadding * 2),
                                store: storeList[index]),
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
