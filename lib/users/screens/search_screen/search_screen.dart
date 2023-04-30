import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopa/stores/model/product_model.dart';
import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:coopa/users/widgets/search_products_card.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  CollectionReference inventoryRef =
      FirebaseFirestore.instance.collection('inventory');

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: klightGrayClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(children: [
            //appbar code
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                      text: 'Welcome ',
                      style: TextStyle(
                        color: ksecondaryClr,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                      children: [
                        TextSpan(
                            text: 'Dikesh',
                            style: TextStyle(
                              color: kblackClr,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ))
                      ]),
                ),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: klightGrayClr,
                      child: Icon(Icons.search_outlined, color: kblackClr),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NotificationScreen()));
                      },
                      child: const CircleAvatar(
                        backgroundColor: klightGrayClr,
                        child: Icon(Icons.notifications_outlined,
                            color: kblackClr),
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            //product Search Section
            // TextFormField(
            //   cursorColor: kprimaryClr,
            //   decoration: InputDecoration(
            //       fillColor: Primary0,
            //       filled: true,
            //       border: OutlineInputBorder(
            //         borderSide: BorderSide.none,
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       hintText: 'Search Here...',
            //       prefixIcon: const Icon(
            //         Icons.search,
            //         color: kprimaryClr,
            //       )),
            // ),
            // const SizedBox(
            //   height: 15,
            // ),
            //category Section
            // const CategoryCard(),

            const SizedBox(
              height: 5,
            ),
            //product Section
            // ProductSection(),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .orderBy('registerAt', descending: true)
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }

                  final products = snapshot.data!.docs
                      .map((doc) =>
                          Product.fromJson(doc.data()! as Map<String, dynamic>))
                      .toList();

                  final productIds =
                      snapshot.data!.docs.map((e) => e.id).toList();

                  return StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('stores')
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      final stores = snapshot.data!.docs
                          .map((doc) => Store.fromJson(
                              doc.data()! as Map<String, dynamic>))
                          .toList();

                      final Map<String, Store> storeMap = { for (var store in stores) store.id : store };

                      return GridView.builder(
                        itemCount: products.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          childAspectRatio: 0.54,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];
                          final store = storeMap[product.storeId];

                          return SearchProductCard(
                              product: product, store: store!);
                        },
                      );
                    },
                  );
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}


//  Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//           child: StreamBuilder<QuerySnapshot>(
//             stream: FirebaseFirestore.instance
//                 .collection('products')
//                 .orderBy('registerAt', descending: true)
//                 .snapshots(),
//             builder:
//                 (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (snapshot.hasError) {
//                 return Text('Something went wrong');
//               }

//               if (snapshot.connectionState == ConnectionState.waiting) {
//                 return Center(child: CircularProgressIndicator());
//               }

//               final products = snapshot.data!.docs
//                   .map((doc) =>
//                       Product.fromJson(doc.data()! as Map<String, dynamic>))
//                   .toList();

//               final productIds = snapshot.data!.docs.map((e) => e.id).toList();

//               return StreamBuilder<QuerySnapshot>(
//                 stream:
//                     FirebaseFirestore.instance.collection('stores').snapshots(),
//                 builder: (BuildContext context,
//                     AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.hasError) {
//                     return Text('Something went wrong');
//                   }

//                   if (snapshot.connectionState == ConnectionState.waiting) {
//                     return Center(child: CircularProgressIndicator());
//                   }

//                   final stores = snapshot.data!.docs
//                       .map((doc) =>
//                           Store.fromJson(doc.data()! as Map<String, dynamic>))
//                       .toList();

//                   final Map<String, Store> storeMap = Map.fromIterable(
//                     stores,
//                     key: (store) => store.id,
//                     value: (store) => store,
//                   );

//                   return GridView.builder(
//                     itemCount: products.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 5,
//                       mainAxisSpacing: 5,
//                       childAspectRatio: 0.75,
//                     ),
//                     itemBuilder: (BuildContext context, int index) {
//                       final product = products[index];
//                       final store = storeMap[product.storeId];

//                       return SearchProductCard(product: product, store: store!);
//                     },
//                   );
//                 },
//               );
//             },
//           ),
//         )