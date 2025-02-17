part of 'shared.dart';

const double defaultMargin = 24;

Color mainColor = 'FFC700'.toColor();
Color greyColor = '8D92A3'.toColor();

Widget loadingIndicator = SpinKitFadingCircle(
size: 45,
color: mainColor,
);

TextStyle greyFontStyle = GoogleFonts.notoSansDisplay().copyWith(color: greyColor);
TextStyle blackFontStyle = GoogleFonts.notoSansDisplay().copyWith(
    color: Colors.black,
    fontSize: 22,
    fontWeight: FontWeight.w500);
TextStyle blackFontStyle2 = GoogleFonts.notoSansDisplay().copyWith(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500);
TextStyle blackFontStyle3 = GoogleFonts.notoSansDisplay().copyWith(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w300);