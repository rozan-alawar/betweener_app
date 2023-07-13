import 'package:betweener_app/app/util/resources/style_manager.dart';
import 'package:flutter/material.dart';
import 'color_manager.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
      scaffoldBackgroundColor: ColorManager.kScaffoldColor,
      useMaterial3: true,
      colorSchemeSeed: ColorManager.kPrimaryColor,

      //App Bar Theme
      appBarTheme: AppBarTheme(
        titleTextStyle: getLargeStyle(),
      ),

      //elevted button
      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     textStyle: getHeading1Style(
      //         color: ColorManager.darkTextPrimaryColor,
      //         fontsize: AppFontSize.s12),
      //     backgroundColor: ColorManager.primaryMainEnableColor,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(8),
      //     ),
      //   ),
      // ),

      // input decoration theme  (Text form field )
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,

        //content padding
        // contentPadding: EdgeInsets.symmetric(
        //     horizontal: AppWidthSize.w16, vertical: AppHeightSize.h16),

        //hint Style
        hintStyle: getHintTextStyle(),

        //error text style
        errorStyle: const TextStyle(height: 0.8, fontWeight: FontWeight.normal),

        //enabeld border style
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: ColorManager.kPrimaryColor, width: 2)),

        // focus border style
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: ColorManager.kPrimaryColor, width: 2)),

        //error border style
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: ColorManager.kPrimaryColor, width: 2)),
        //focus error border style
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                const BorderSide(color: ColorManager.kPrimaryColor, width: 2)),
      ));
}

// //2018
// // headline1    96.0  light   -1.5
// // headline2    60.0  light   -0.5
// // headline3    48.0  regular  0.0
// // headline4    34.0  regular  0.25
// // headline5    24.0  regular  0.0
// // headline6    20.0  medium   0.15
// // subtitle1    16.0  regular  0.15
// // subtitle2    14.0  medium   0.1
// // body1        16.0  regular  0.5   (bodyText1)
// // body2        14.0  regular  0.25  (bodyText2)
// // button       14.0  medium   1.25
// // caption      12.0  regular  0.4
// // overline     10.0  regular  1.5
