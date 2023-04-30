import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coopa/stores/helper/my_date_util.dart';
import 'package:coopa/stores/model/product_model.dart';
import 'package:coopa/stores/model/store_model.dart';
import 'package:coopa/theme/style.dart';
import 'package:coopa/users/screens/notification_screen/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';


class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
    );
    return Scaffold(
      backgroundColor: klightGrayClr,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                    color: Colors.white,
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

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        }

                        final products = snapshot.data!.docs
                            .map((doc) => Product.fromJson(
                                doc.data()! as Map<String, dynamic>))
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

                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            }

                            final stores = snapshot.data!.docs
                                .map((doc) => Store.fromJson(
                                    doc.data()! as Map<String, dynamic>))
                                .toList();

                            final Map<String, Store> storeMap =
                                { for (var store in stores) store.id : store };

                            return ListView.builder(
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                final product = products[index];
                                final store = storeMap[product.storeId];

                                return HomeCard(
                                    product: product, store: store!);
                              },
                            );
                          },
                        );
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ...List.generate(
//   posts.length,
//   (index) {
//     Map post = posts[index];
//     return HomeCard(
//       dp: post["dp"],
//       name: post['name'],
//       img: "assets/images/dm$index.jpg",
//       des: post['des'],
//       hash: post['hash'],
//     );
//   },
// ),
class HomeCard extends StatefulWidget {
  final Product product;
  final Store store;

  const HomeCard({
    Key? key,
    required this.product,
    required this.store,
  }) : super(key: key);
  @override
  _HomeCardState createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
            child: ShaderMask(
              shaderCallback: (rect) {
                return LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withOpacity(0.7),
                  ],
                ).createShader(
                    Rect.fromLTRB(0, 300, rect.width, rect.height - 1));
              },
              blendMode: BlendMode.darken,
              child: Container(
                height: MediaQuery.of(context).size.width * 1.45,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(widget.product.image),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          //Side-bar Container
          Positioned(
            right: 5,
            top: MediaQuery.of(context).size.shortestSide < 600
                ? (MediaQuery.of(context).size.width * 1.45 -
                        MediaQuery.of(context).size.width * 1.25) /
                    2
                : (MediaQuery.of(context).size.width * 1.45 -
                        MediaQuery.of(context).size.width * 0.7) /
                    2,
            child: Stack(
              children: [
                SizedBox(
                  width:
                      MediaQuery.of(context).size.shortestSide < 600 ? 80 : 180,
                  height: MediaQuery.of(context).size.shortestSide < 600
                      ? MediaQuery.of(context).size.width * 1.25
                      : MediaQuery.of(context).size.width * 0.7,
                ),
                Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    left: 0,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: (MediaQuery.of(context).size.width * 1.25) / 8.1,
                        bottom:
                            (MediaQuery.of(context).size.width * 1.25) / 8.1,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white.withOpacity(0.4),
                              ),
                              height: 60,
                              width: 60,
                              child: Padding(
                                  padding: const EdgeInsets.all(17.0),
                                  child: SvgPicture.asset(
                                    isLiked
                                        ? "assets/icons/heart-shape-silhouette.svg"
                                        : "assets/icons/heart-shape-outine.svg",
                                    color: isLiked
                                        ? Colors.red.shade500
                                        : Color(0xffffffff),
                                  )),
                            ),
                            onTap: () {
                              setState(() {
                                isLiked = !isLiked;
                              });
                            },
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                "assets/icons/comment-option.svg",
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                "assets/icons/bookmark-black-shape.svg",
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white.withOpacity(0.4),
                            ),
                            height: 60,
                            width: 60,
                            child: Padding(
                              padding: const EdgeInsets.all(17.0),
                              child: SvgPicture.asset(
                                "assets/icons/plane.svg",
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(widget.store.images),
                        radius: 22,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.store.name,
                              maxLines: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            MyDateUtil.getFormattedTime(context: context, time: widget.product.registerAt),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.product.description,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'This item costs   ',
                      children: <TextSpan>[
                        TextSpan(
                          text: '\u{20B9}${widget.product.price}',
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        TextSpan(
                          text: '  \u{20B9}${widget.product.discount}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
