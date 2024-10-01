import 'package:flutter/material.dart';
import 'package:food_e/helpers/colors_helper.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/pages/splash/controllers/splash_page_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'pages/profile/pages/account_profile/account_profile_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashPageController>(
          create: (_) => SplashPageController(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Food-E',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        // This is the theme of your application.
        colorScheme: ColorScheme.fromSeed(seedColor: ColorsHelper.primaryDark),
        scaffoldBackgroundColor: ColorsHelper.light,

        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        // This is the theme of your application.
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
            borderRadius: BorderRadius.circular(
              45,
            ),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          position: PopupMenuPosition.over,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              45,
            ),
          ),
        ),
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

        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            backgroundColor: ColorsHelper.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
          ),
        ),

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
        colorScheme: ColorScheme.fromSeed(
          seedColor: ColorsHelper.primary,
        ),
        scaffoldBackgroundColor: ColorsHelper.dark,

        appBarTheme: const AppBarTheme(
          backgroundColor: ColorsHelper.dark,
          foregroundColor: ColorsHelper.light,
        ),
        primaryColor: ColorsHelper.primary,
        primaryColorDark: ColorsHelper.primaryDark,
        primaryColorLight: ColorsHelper.primaryLight,
        useMaterial3: true,
      ),
      home: const AccountProfilePage(),
      //initialRoute: RouterHelper.splashPage,
      onGenerateRoute: RouterHelper.generateRoute,
    );
  }
}
