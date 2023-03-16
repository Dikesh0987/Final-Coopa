import 'package:coopa/users/components/menu_card.dart';
import 'package:coopa/users/components/restaurant_info.dart';
import 'package:coopa/users/models/menu.dart';
import 'package:coopa/users/widgets/customappbarwidgets.dart';
import 'package:flutter/material.dart';


class RestaurantMenuScreen extends StatefulWidget {
  final String image;
  final String name;
  RestaurantMenuScreen({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<RestaurantMenuScreen> createState() => _RestaurantMenuScreenState();
}

class _RestaurantMenuScreenState extends State<RestaurantMenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: CustomScrollView(
      slivers: [
        CustomAppBarWidget(
          image: widget.image,
        ),
        SliverToBoxAdapter(
          child: RestaurantInfo(name: widget.name),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, categoryIndex) {
                List<Menu> items = demoCategoryMenus[categoryIndex].items;
                return RestaurantMenuItem(
                    title: demoCategoryMenus[categoryIndex].category,
                    items: List.generate(
                        items.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: RestaurantMenuCard(
                                  image: items[index].image,
                                  title: items[index].title,
                                  price: items[index].price),
                            )));
              },
              childCount: demoCategoryMenus.length,
            ),
          ),
        )
      ],
    )));
  }
}
