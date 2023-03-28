import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Primary Colors ..
const Primary0 = Color(0xFFFFFDFD);
const Primary1 = Color(0xff3E54AC);

// for dash

Color bgColor = const Color(0xFFFFFDFD);
Color sparatorColor = const Color(0xFFF5F4F4);
Color gray = const Color(0xFFE7E7E7);
Color grayText = const Color(0xFFBDBDBD);
Color purple1 = const Color(0xFF4F3A57);
Color purple2 = const Color(0xFFBB6BD9);
Color purpleLight = const Color(0xFFF7E3FF);
Color green = const Color(0xFF6FCF97);
Color greenLight = const Color(0XFFD8FFE8);
Color yellowLight = const Color(0xFFFFF7DF);
Color blueLight = const Color(0xFFDEF7FF);
Color labelColor = const Color(0xFF485465);
Color red = const Color(0xFFEB5757);

TextStyle textBold = GoogleFonts.openSans()
    .copyWith(fontWeight: FontWeight.bold, fontSize: 24, color: purple1);

TextStyle textBold2 = GoogleFonts.poppins().copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 10,
  color: grayText,
  letterSpacing: 6 / 100,
);

TextStyle textBold3 = GoogleFonts.openSans().copyWith(
  fontWeight: FontWeight.bold,
  fontSize: 18,
  color: green,
);

TextStyle textSemiBold = GoogleFonts.openSans()
    .copyWith(fontWeight: FontWeight.w600, fontSize: 13, color: purple1);

TextStyle label = GoogleFonts.openSans()
    .copyWith(fontWeight: FontWeight.w400, fontSize: 11, color: labelColor);




// for store details


Color backgroundColor0 = Color(0xffF8CBDE);
Color backgroundColor1 = Color(0xffE5EBED);
Color backgroundColor2 = Color(0xffDCD1EF);
Color titleColor = Color(0xff052250);

TextStyle kSubTitleStyle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w700,
  color: titleColor,
  fontSize: 35,
);

TextStyle kTitleStyle = GoogleFonts.nunitoSans(
  fontWeight: FontWeight.w700,
  color: titleColor,
  fontSize: 45,
);

TextStyle kTabTextStyleSelected = GoogleFonts.nunitoSans(
  color: titleColor,
  fontSize: 24,
  fontWeight: FontWeight.w700,
);

TextStyle kTabTextStyleUnSelected = GoogleFonts.nunitoSans(
  color: titleColor.withOpacity(0.5),
  fontSize: 24,
  fontWeight: FontWeight.w300,
);