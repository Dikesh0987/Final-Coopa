import 'package:coopa/stores/model/product_model.dart';
import 'package:coopa/stores/screens/edit_product_screen/edit_product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:share/share.dart';

class ProductCard extends StatefulWidget {
  const ProductCard({super.key, required this.product});
  final Product product;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
   bool _tvalue = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: InkWell(
        onTap: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => EditProductScreen()));

          // for add product view data
        },
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Dikesh kumar netam",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          PopupMenuButton(
                            padding: EdgeInsets.all(0),
                            position: PopupMenuPosition.under,
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 'edit',
                                  child: Text(
                                    'Edit',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'delete',
                                  child: Text(
                                    'Delete',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 'share',
                                  child: Text(
                                    'Share',
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                )
                              ];
                            },
                            onSelected: (value) {
                              // Handle the selected menu item here
                              switch (value) {
                                case 'edit':
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              EditProductScreen()));
                                  break;
                                case 'delete':
                                  // Handle the Delete action
                                  break;
                                case 'share':
                                  context.findRenderObject();
                                  Share.share(
                                      'Check out this cool Flutter app!');
                                  break;
                              }
                            },
                          ),
                        ],
                      ),
                      Text(
                        "7 pices",
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "₹50",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "In stock",
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ),
                          FlutterSwitch(
                            height: 20.0,
                            width: 40.0,
                            padding: 4.0,
                            toggleSize: 15.0,
                            borderRadius: 10.0,
                            activeColor: Colors.lightBlue,
                            value: _tvalue,
                            onToggle: (value) {
                              setState(() {
                                _tvalue = value;
                              });
                            },
                          ),
                        ],
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