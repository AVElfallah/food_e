import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/pages/splash/layouts/splash_screen_3.dart';

import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_padding.dart';
import '../../../shared/constants/constant_string.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  @override
  Widget build(BuildContext context) {
    final canvasHeight = MediaQuery.of(context).size.height;
    final canvasWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          //image
          DecoratedBox(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 0.3),
                  Color.fromRGBO(0, 0, 0, .7)
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            position: DecorationPosition.foreground,
            child: Image.asset(
              AssetsHelper.chiefImage,
              width: canvasWidth,
              height: canvasHeight,
              fit: BoxFit.cover,
            ),
          )
          //
          ,
          Positioned(
            top: canvasHeight * .06,
            child: Hero(
              tag: foodELogoHeroTag,
              child: Text.rich(
                TextSpan(
                  text: 'Food-',
                  style: context.textTheme.headlineMedium,
                  children: const [
                    TextSpan(
                      text: 'E',
                      style: TextStyle(
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: canvasHeight,
            width: canvasWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text.rich(
                    const TextSpan(
                      text: 'awesome\n',
                      children: [
                        TextSpan(
                          text: 'local',
                          style: TextStyle(
                            color: ColorsHelper.primary,
                          ),
                        ),
                        TextSpan(text: ' food'),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    style: context.textTheme.headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: pad20All,
                  child: Text(
                    'Discover delicious food from the amazing restaurants near you',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const SplashScreen3(),
                        ),
                      );
                    },
                    child: const Text(
                      'Next',
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
