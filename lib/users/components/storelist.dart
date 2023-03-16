import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';
import '../constants/fontsizes.dart';

class StoreListWidget extends StatelessWidget {
  String name, location, img;
  final double rating;
  StoreListWidget(
      {Key? key,
      required this.img,
      required this.location,
      required this.name,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
          height: 150,
          decoration: BoxDecoration(
            color: kwhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(img), fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              color: textBlack,
                              fontSize: titleFontSize,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            const Text(
                              "4.3",
                              style: TextStyle(
                                color: grey,
                                fontSize: subTitleFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SvgPicture.asset("assets/icons/rating.svg"),
                            const SizedBox(width: 4),
                            const Text(
                              "200+ Ratings",
                              style: TextStyle(
                                color: grey,
                                fontSize: subTitleFontSize,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        const Text(
                          "400 meters ",
                          style: TextStyle(
                            color: secondary,
                            fontSize: 13,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Spacer(),
                        OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            primary: kwhite,
                            backgroundColor: kMainColor,
                            fixedSize: const Size(140, 40),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            ),
                          ),
                          child: Text(
                            "Join With Us".toUpperCase(),
                            style: const TextStyle(fontSize: 12),
                          ),
                        )
                      ],
                    ),
                  ))
            ],
          )),
    );
  }
}
