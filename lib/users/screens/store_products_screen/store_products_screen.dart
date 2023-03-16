import 'package:coopa/users/components/product_card.dart';
import 'package:coopa/users/components/store_info.dart';
import 'package:coopa/users/models/products.dart';
import 'package:coopa/users/widgets/customappbarwidgets.dart';
import 'package:flutter/material.dart';


class StoreProductScreen extends StatefulWidget {
  String name, image;
  StoreProductScreen({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<StoreProductScreen> createState() => _StoreProductScreenState();
}

class _StoreProductScreenState extends State<StoreProductScreen> {
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
          child: StoreInfo(
            name: widget.name,
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, categoryIndex) {
                List<Product> items = productsCategory[categoryIndex].items;
                return StoreProductItem(
                    title: productsCategory[categoryIndex].category,
                    items: List.generate(
                        items.length,
                        (index) => Padding(
                              padding: EdgeInsets.only(bottom: 16),
                              child: StoreProductCard(
                                  image: items[index].image,
                                  title: items[index].title,
                                  price: items[index].price),
                            )));
              },
              childCount: productsCategory.length,
            ),
          ),
        )
      ],
    )));
  }
}
