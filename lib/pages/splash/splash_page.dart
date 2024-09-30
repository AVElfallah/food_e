import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:food_e/pages/splash/controllers/splash_page_controller.dart';
import 'package:food_e/pages/splash/layouts/splash_screen_2.dart';
import 'package:provider/provider.dart';

import 'layouts/splash_screen_1.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final screens = [
    const SplashScreen1(),
    const SplashScreen2(),
  ];

  final hide1stScreenDuration = const Duration(milliseconds: 3000);

  @override
  void initState() {
    super.initState();

    Future.delayed(hide1stScreenDuration).whenComplete(
      () {
        Provider.of<SplashPageController>(context, listen: false)
            .toNextScreen();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var pageProviderWatch = context.watch<SplashPageController>();
    return FadeIn(
        animate: true,
        duration: const Duration(milliseconds: 1500),
        child: screens[pageProviderWatch.screenNumber]);
  }
}
