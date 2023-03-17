import 'package:flutter/material.dart';

final ThemeData baseLigth = ThemeData.light();

class StoreTheme {
  static Color tentColor = const Color(0xfffa6501);
  static Color commonColor = const Color(0xff595959);
  static Color dimColor = const Color(0xfff5f5f5);
  static Color unselectedColor = const Color(0xFFC0C0C0);
  static Color breakerColor = const Color(0xff27ae61);
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      progressIndicatorTheme: ProgressIndicatorThemeData(
          linearMinHeight: 1, color: StoreTheme.commonColor),
      brightness: Brightness.light,
      primaryColor: tentColor,
      scaffoldBackgroundColor: Colors.white,
      // TextButton
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: const Color(0xff595959),
              textStyle: const TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              padding: const EdgeInsets.all(12))),
      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18.0),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Vazir",
                  fontSize: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color(0xffff7f00),
              foregroundColor: Colors.white)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xfff5f5f5),
          titleTextStyle: TextStyle(
              color: Color(0xff444444),
              fontSize: 22,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w800),
          iconTheme: IconThemeData(
            color: Color(0xff595959),
            size: 20,
          ),
          elevation: 2),
      iconTheme: const IconThemeData(
        color: Color.fromARGB(255, 49, 49, 49),
        size: 20,
      ),
      cardTheme: CardTheme(
        color: const Color(0xfff5f5f5),
        elevation: 1.5,
        margin: const EdgeInsets.only(left: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(tentColor),
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w900),
          bodyMedium: TextStyle(
              color: Color.fromARGB(255, 48, 48, 48),
              fontSize: 18,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w600),
          displayLarge: TextStyle(
              color: Color(0xff444444),
              fontSize: 28,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w800),
          displayMedium: TextStyle(
              color: Color(0xff444444),
              fontSize: 26,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w700),
          displaySmall: TextStyle(
              color: Color(0xff444444),
              fontSize: 24,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
              color: Color(0xff444444),
              fontSize: 22,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w500),
          headlineSmall: TextStyle(
              color: Color(0xff444444),
              fontSize: 14,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w400),
          titleLarge: TextStyle(
              color: Color(0xffff7f00),
              fontSize: 30,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w700),
          titleMedium: TextStyle(
              color: Color(0xff535353),
              fontSize: 12,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w400),
          titleSmall: TextStyle(
              color: Color(0xff919191),
              fontSize: 12,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w400)),
      dividerColor: const Color(0xffff7f00),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      progressIndicatorTheme: ProgressIndicatorThemeData(
          linearMinHeight: 1, color: StoreTheme.commonColor),
      brightness: Brightness.dark,
      primaryColor: tentColor,
      scaffoldBackgroundColor: const Color(0xff565656),
      // TextButton
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
              foregroundColor: const Color(0xffcfcfcf),
              textStyle: const TextStyle(
                  fontFamily: "Vazir",
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
              padding: const EdgeInsets.all(12))),
      // ElevatedButton
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(18.0),
              textStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: "Vazir",
                  fontSize: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              backgroundColor: const Color(0xffff7f00),
              foregroundColor: Colors.white)),
      appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff414141),
          titleTextStyle: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 22,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w800),
          iconTheme: IconThemeData(
            color: Color(0xffcfcfcf),
            size: 20,
          ),
          elevation: 2),
      iconTheme: const IconThemeData(
        color: Color(0xffcfcfcf),
        size: 20,
      ),
      cardTheme: CardTheme(
        color: const Color(0xff414141),
        elevation: 1.5,
        margin: const EdgeInsets.only(left: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.all(tentColor),
      ),
      textTheme: const TextTheme(
          bodyLarge: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w900),
          bodyMedium: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 18,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w600),
          displayLarge: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 28,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w800),
          displayMedium: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 26,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w700),
          displaySmall: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 24,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w600),
          headlineMedium: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 22,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w500),
          headlineSmall: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 14,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w400),
          titleLarge: TextStyle(
              color: Color(0xffff7f00),
              fontSize: 30,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w700),
          titleMedium: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 12,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w400),
          titleSmall: TextStyle(
              color: Color(0xffcfcfcf),
              fontSize: 12,
              fontFamily: "Vazir",
              fontWeight: FontWeight.w400)),
      dividerColor: const Color(0xffff7f00),
    );
  }
}
