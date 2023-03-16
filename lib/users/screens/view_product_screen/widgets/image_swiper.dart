import 'package:flutter/material.dart';

class ImageSwiper extends StatelessWidget {
  const ImageSwiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Image(image: AssetImage('assets/images/camera.png')));
  }
}
