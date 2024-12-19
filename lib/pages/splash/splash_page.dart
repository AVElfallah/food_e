import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/pages/splash/layouts/splash_screen_2.dart';
import 'package:food_e/shared/common/riverpod_objects.dart';

import 'layouts/splash_screen_1.dart';


class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
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
        ref.read(RiverpodObjects.init()
            .splashPageControllerProvider).toNextScreen();
            
      },
    );

  }

  @override
  Widget build(BuildContext context) {
    var pageProviderWatch =
        ref.watch(RiverpodObjects.init().splashPageControllerProvider);
    return FadeIn(
        animate: true,
        duration: const Duration(milliseconds: 1500),
        child: screens[pageProviderWatch.screenNumber]);
  }
}


