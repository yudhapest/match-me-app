import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssetImageIconManager {
  static const String assetPath = "assets/images/";
}

class ColorManager {
  static Color primaryColor = HexColor.fromHex('#03091C');
  static Color secondaryColor = HexColor.fromHex('#262F4B');
  static Color whiteColor = HexColor.fromHex('#FFFFFF');
  static Color pinkColor = HexColor.fromHex('#EA887B');
  static Color purpleColor = HexColor.fromHex('#CE92E3');
  static Color brightGreyColor = HexColor.fromHex('#737D9C');
  static Color darkGreyColor = HexColor.fromHex('#5B6279');
  static Color lightGreyColor = HexColor.fromHex('#D9D9D9');
  static Color greyColor = HexColor.fromHex('#A9A9AC');
}

extension HexColor on Color {
  static Color fromHex(String hexColor) {
    hexColor = hexColor.replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return Color(int.parse(hexColor, radix: 16));
  }
}

class FontFamilyConstants {
  static String fontFamily = GoogleFonts.poppins.toString();
}

class FontWeightManager {
  static const FontWeight light = FontWeight.w300;
  static const FontWeight regular = FontWeight.w400;
  static const FontWeight medium = FontWeight.w500;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight bold = FontWeight.w700;
}

class FontSizeManager {
  static const double f12 = 12.0;
  static const double f14 = 14.0;
  static const double f16 = 16.0;
  static const double f18 = 18.0;
  static const double f20 = 20.0;
  static const double f22 = 22.0;
  static const double f24 = 24.0;
  static const double f26 = 26.0;
  static const double f28 = 28.0;
}

TextStyle _getTextStyle(
  double fontSize,
  String fontFamily,
  FontWeight fontWeight,
  Color color,
) {
  return GoogleFonts.poppins().copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      fontFamily: fontFamily);
}

TextStyle getWhiteTextStyle({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstants.fontFamily,
    fontWeight,
    ColorManager.whiteColor,
  );
}

TextStyle getDarkGreyTextStyle({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstants.fontFamily,
    fontWeight,
    ColorManager.darkGreyColor,
  );
}

TextStyle getBrightGreyTextStyle({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstants.fontFamily,
    fontWeight,
    ColorManager.brightGreyColor,
  );
}

TextStyle getGreyTextStyle({
  double fontSize = FontSizeManager.f16,
  FontWeight fontWeight = FontWeightManager.regular,
}) {
  return _getTextStyle(
    fontSize,
    FontFamilyConstants.fontFamily,
    fontWeight,
    ColorManager.greyColor,
  );
}

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: ColorManager.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorManager.primaryColor,
      elevation: 0,
    ),
    fontFamily: FontFamilyConstants.fontFamily,
  );
}

class AppMargin {
  static const double m2 = 2.0;
  static const double m4 = 4.0;
  static const double m6 = 6.0;
  static const double m8 = 8.0;
  static const double m10 = 10.0;
  static const double m12 = 12.0;
  static const double m14 = 14.0;
  static const double m16 = 16.0;
  static const double m18 = 18.0;
  static const double m20 = 20.0;
  static const double m22 = 22.0;
  static const double m24 = 24.0;
  static const double m26 = 26.0;
  static const double m28 = 28.0;
  static const double m30 = 30.0;
  static const double m32 = 32.0;
  static const double m34 = 34.0;
  static const double m36 = 36.0;
  static const double m38 = 38.0;
  static const double m40 = 40.0;
  static const double m50 = 50.0;
}

class AppPadding {
  static const double p2 = 2.0;
  static const double p4 = 4.0;
  static const double p6 = 6.0;
  static const double p8 = 8.0;
  static const double p10 = 10.0;
  static const double p12 = 12.0;
  static const double p14 = 14.0;
  static const double p16 = 16.0;
  static const double p18 = 18.0;
  static const double p20 = 20.0;
  static const double p22 = 22.0;
  static const double p24 = 24.0;
  static const double p26 = 26.0;
  static const double p28 = 28.0;
  static const double p30 = 30.0;
  static const double p32 = 32.0;
  static const double p34 = 34.0;
  static const double p36 = 36.0;
  static const double p38 = 38.0;
  static const double p40 = 40.0;
  static const double p50 = 50.0;
}

class AppSize {
  static const double s2 = 2.0;
  static const double s4 = 4.0;
  static const double s6 = 6.0;
  static const double s8 = 8.0;
  static const double s10 = 10.0;
  static const double s12 = 12.0;
  static const double s14 = 14.0;
  static const double s16 = 16.0;
  static const double s18 = 18.0;
  static const double s20 = 20.0;
  static const double s22 = 22.0;
  static const double s24 = 24.0;
  static const double s26 = 26.0;
  static const double s28 = 28.0;
  static const double s30 = 30.0;
  static const double s32 = 32.0;
  static const double s34 = 34.0;
  static const double s36 = 36.0;
  static const double s38 = 38.0;
  static const double s40 = 40.0;
  static const double s50 = 50.0;
}
