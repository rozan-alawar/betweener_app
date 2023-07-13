import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double size,
  Color color,
  FontWeight fontWeight,
) =>
    TextStyle(
      fontSize: size,
      color: color,
      fontWeight: fontWeight,
    );

TextStyle getLargeStyle(
        {double size = FontSize.s18,
        Color color = ColorManager.kPrimaryColor}) =>
    _getTextStyle(size, color, FontWeightManager.bold);

TextStyle getMediumStyle(
        {double size = FontSize.s14,
        Color color = ColorManager.kPrimaryColor}) =>
    _getTextStyle(size, color, FontWeightManager.medium);

TextStyle getHintTextStyle(
        {double size = FontSize.s12,
        Color color = ColorManager.hintTextColor}) =>
    _getTextStyle(size, color, FontWeightManager.medium);
