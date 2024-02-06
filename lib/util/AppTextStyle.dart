// final categoryTextStyle=Theme.of(context).textTheme.titleSmall.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*extension NumberOperation on double{
  int get toSafeInt => (isNaN || isInfinite)?0 :toInt();
}*/
/*extension AppTextStyle on BuildContext{
  TextStyle get categoryText=>GoogleFonts.roboto();
}*/
TextStyle get categoryText => GoogleFonts.roboto();
TextStyle get sectionTitle =>
    GoogleFonts.roboto(fontWeight: FontWeight.normal, fontSize: 18);

TextStyle get productText =>
    GoogleFonts.openSans(fontSize: 12, color: Colors.black87);
TextStyle get productTitle =>
    GoogleFonts.openSans(fontWeight: FontWeight.normal, fontSize: 16);
TextStyle get productPrice => GoogleFonts.openSans(
    fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w600);
TextStyle get productOfferPrice => productPrice.copyWith(
    decoration: TextDecoration.lineThrough, fontWeight: FontWeight.w100);

TextStyle get bannerText => GoogleFonts.openSans(
    fontSize: 18, color: Colors.white, fontWeight: FontWeight.w500);
TextStyle get searchBox => GoogleFonts.openSans(
    fontSize: 16, color: Colors.black54, fontWeight: FontWeight.normal);
