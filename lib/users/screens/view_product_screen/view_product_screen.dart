import 'package:flutter/material.dart';

import 'widgets/appbar.dart';
import 'widgets/image_swiper.dart';
import 'widgets/product_description.dart';

class ViewProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        CustomAppBar(),

        Expanded(child: ImageSwiper()),

        // Spacer(),

        ProductDescription(),
      ],
    ));
  }
}
