import 'package:bookly_app/core/constants/app_fonts.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle(
  double fontSize,
  FontWeight fontWeight,
  Color color,
  String? fontFamily,
) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily ?? FontConstants.primaryArabicFont,
    color: color,
    fontWeight: fontWeight,
  );
}

// regular style
TextStyle getRegularStyle({
  required double fontSize,
  required Color color,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.regular,
    color,
    fontFamily,
  );
}

// medium style
TextStyle getMediumStyle({
  required double fontSize,
  required Color color,
  String? fontFamily,
}) {
  return _getTextStyle(fontSize, FontWeightConstants.medium, color, fontFamily);
}

// semiBold style
TextStyle getSemiBoldStyle({
  required double fontSize,
  required Color color,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize,
    FontWeightConstants.semiBold,
    color,
    fontFamily,
  );
}

// bold style
TextStyle getBoldStyle({
  required double fontSize,
  required Color color,
  String? fontFamily,
}) {
  return _getTextStyle(fontSize, FontWeightConstants.bold, color, fontFamily);
}
