import 'package:flutter/material.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/helpers/theme_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/shared/common/riverpod_objects.dart';

void main() {
  RiverpodObjects.init();

  runApp(
    const ProviderScope(
      child: MyApp(),
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
      themeMode: ThemeMode.light,

      theme: ThemeHelper.lightTheme(canvasWidth, canvasHeight),
      darkTheme: ThemeHelper.darkTheme(canvasWidth, canvasHeight),
      //home:  ChangePasswordPage(),
      initialRoute: RouterHelper.splashPage,
      onGenerateRoute: RouterHelper.generateRoute,
    );
  }
}
