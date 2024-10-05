import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/text_theme_helper.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeHelper {
  // LightTheme [START]
  // Define the light theme for the application
  static ThemeData lightTheme(double canvasWidth, double canvasHeight) =>
      ThemeData(
        // Set the color scheme using a seed color
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsHelper.primaryDark),
        // Set the background color for scaffold widgets
        scaffoldBackgroundColor: Colors.white,
        // Enable Material 3 design
        useMaterial3: true,
        // Set the text theme with a specific color
        textTheme: TextThemeHelper.withColor(Colors.black).textTheme,

        chipTheme: ChipThemeData(
          backgroundColor: ColorsHelper.light,
          side: BorderSide.none,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
        // Define the popup menu theme
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.over,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
        // Define the dropdown menu theme
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            outlineBorder: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        // Define the icon button theme
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: ColorsHelper.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // Define the elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: ColorsHelper.primary,
            textStyle: GoogleFonts.bebasNeue(fontSize: 20),
            fixedSize: Size(
              canvasWidth - 30,
              canvasHeight * .025,
            ),
          ),
        ),
        //

        // Define the outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: Size(
              canvasWidth - 30,
              canvasHeight * .025,
            ),
            overlayColor: Colors.amber,
            foregroundColor: ColorsHelper.primary,
            textStyle: GoogleFonts.bebasNeue(fontSize: 20),
            side: const BorderSide(
              color: ColorsHelper.primary,
            ),
          ),
        ),

        // Set the background color for scaffold widgets
        // Define the app bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsHelper.white,
          foregroundColor: ColorsHelper.dark,
        ),
        // Set primary colors
        primaryColor: ColorsHelper.primary,
        primaryColorDark: ColorsHelper.primaryDark,
        primaryColorLight: ColorsHelper.primaryLight,
        // Enable Material 3 design
      );
  // LightTheme [END]

  // DarkTheme [START]
  // Define the dark theme for the application
  static ThemeData darkTheme(double canvasWidth, double canvasHeight) =>
      ThemeData(
        // Set the text theme with a specific color
        textTheme: TextThemeHelper.withColor(Colors.white).textTheme,
        // Define the chip theme
        chipTheme: ChipThemeData(
          backgroundColor: ColorsHelper.white,
          labelStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 6,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
        // Define the popup menu theme
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.over,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(45),
          ),
        ),
        // Define the dropdown menu theme
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(45),
            ),
            outlineBorder: const BorderSide(
              color: Colors.white,
            ),
          ),
        ),
        // Define the icon button theme
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: ColorsHelper.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        // Define the elevated button theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: ColorsHelper.primary,
            textStyle: GoogleFonts.bebasNeue(fontSize: 20),
            fixedSize: Size(
              canvasWidth - 30,
              canvasHeight * .025,
            ),
          ),
        ),
        //

        // Define the outlined button theme
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            fixedSize: Size(
              canvasWidth - 30,
              canvasHeight * .025,
            ),
            overlayColor: Colors.amber,
            foregroundColor: ColorsHelper.primary,
            textStyle: GoogleFonts.bebasNeue(fontSize: 20),
            side: const BorderSide(
              color: ColorsHelper.primary,
            ),
          ),
        ),
        // Set the color scheme using a seed color
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsHelper.primary,
        ),
        // Set the background color for scaffold widgets
        scaffoldBackgroundColor: ColorsHelper.dark,
        // Define the app bar theme
        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsHelper.dark,
          foregroundColor: ColorsHelper.light,
        ),
        // Set primary colors
        primaryColor: ColorsHelper.primary,
        primaryColorDark: ColorsHelper.primaryDark,
        primaryColorLight: ColorsHelper.primaryLight,
        // Enable Material 3 design
        useMaterial3: true,
      );
  // DarkTheme [END]
}
