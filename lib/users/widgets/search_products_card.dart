import 'package:coopa/stores/model/product_model.dart';
import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/theme/style.dart';
import 'package:flutter/material.dart';

class SearchProductCard extends StatefulWidget {
  const SearchProductCard(
      {super.key, required this.product, required this.store});

  final Product product;
  final Store store;

  @override
  State<SearchProductCard> createState() => _SearchProductCardState();
}

class _SearchProductCardState extends State<SearchProductCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              widget.product.image,
              height: 200,
              width: double.maxFinite,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.store.name,
                  style: const TextStyle(
                    color: ksecondaryClr,
                  ),
                ),
                const Icon(
                  Icons.shopping_basket_outlined,
                  color: ksecondaryClr,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          // const SizedBox(
          //   height: 4,
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 10),
          //   child: Text(
          //     widget.product.description,
          //     maxLines: 2,
          //     style: const TextStyle(fontSize: 11, color: kgrayClr),
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.product.price,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.w500, color: kgrayClr),
            ),
          )
        ],
      ),
    );
  }
}
