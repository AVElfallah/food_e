import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';

import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_padding.dart';
import '../../../shared/constants/constant_string.dart';
import 'splash_screen_4.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
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
              AssetsHelper.manRidingImage,
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
                  style: context.textTheme.headlineMedium
                      ?.copyWith(color: Colors.white),
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
                      text: 'DELIVERED AT\n',
                      children: [
                        TextSpan(text: 'YOUR'),
                        TextSpan(
                          text: ' DOORSTEP',
                          style: TextStyle(
                            color: ColorsHelper.primary,
                          ),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    style: context.textTheme.headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: pad22All,
                  child: Text(
                    'Fresh and delicious local food delivered from the restaurants to your doorstep',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => const SplashScreen4(),
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
