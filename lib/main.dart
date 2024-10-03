import 'package:flutter/material.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/helpers/theme_helper.dart';
import 'package:food_e/pages/splash/controllers/splash_page_controller.dart';
import 'package:provider/provider.dart';

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

      theme: ThemeHelper.lightTheme,
      darkTheme: ThemeHelper.darkTheme(canvasWidth, canvasHeight),
      //home:  ChangePasswordPage(),
      initialRoute: RouterHelper.splashPage,
      onGenerateRoute: RouterHelper.generateRoute,
    );
  }
}
