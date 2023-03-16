import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarWidget extends StatelessWidget {
  final String image;
  const CustomAppBarWidget({Key? key, required this.image,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200,
      backgroundColor: Colors.white,
      pinned: true,
      elevation: 0,
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Padding(
          padding: EdgeInsets.only(left: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset('assets/icons/back.svg'),
          ),
        ),
      ),
      actions: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: SvgPicture.asset(
            'assets/icons/share.svg',
            color: Colors.black,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: SvgPicture.asset(
              'assets/icons/search.svg',
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
