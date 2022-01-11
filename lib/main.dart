import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_list/colors/colors.dart';
import 'package:to_do_list/views/home_page/home_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Lista de afazeres",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: ThemeColors.primaryColor,
        primaryColorDark: ThemeColors.primaryColorDark,
        textTheme: TextTheme(
          headline1: GoogleFonts.oswald(
            fontSize: 27.0,
            color: ThemeColors.fontColor,
            fontWeight: FontWeight.bold,
          ),
          headline2: GoogleFonts.oswald(
            fontSize: 15.0,
            color: ThemeColors.fontColor,
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ThemeColors.buttonColor,
          splashColor: ThemeColors.buttonColor.withOpacity(0.4),
          focusColor: ThemeColors.buttonColor.withGreen(255),
          hoverColor: ThemeColors.buttonColor.withOpacity(0.7),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: ThemeColors.primaryColor,
          elevation: 3.0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.primaryColorDark,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.primaryColorDark.withOpacity(0.4),
            ),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: ThemeColors.primaryColorDark,
          selectionColor: ThemeColors.primaryColor.withOpacity(0.4),
        ),
      ),
      home: HomePage(),
    ),
  );
}
