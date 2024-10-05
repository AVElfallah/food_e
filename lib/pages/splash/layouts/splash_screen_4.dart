import 'package:flutter/material.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:food_e/helpers/router_helper.dart';

import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_string.dart';

class SplashScreen4 extends StatefulWidget {
  const SplashScreen4({super.key});

  @override
  State<SplashScreen4> createState() => _SplashScreen4State();
}

class _SplashScreen4State extends State<SplashScreen4> {
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
              AssetsHelper.androidSmartphoneImage,
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
                      text: 'GRAB THE\n',
                      children: [
                        TextSpan(text: 'BEST '),
                        TextSpan(
                          text: 'DEALS',
                          style: TextStyle(
                            color: ColorsHelper.primary,
                          ),
                        ),
                        TextSpan(text: ' AROUND'),
                      ],
                    ),
                    textAlign: TextAlign.left,
                    style: context.textTheme.headlineLarge
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Text(
                    'Grab the best deals and discounts around and save on your every order',
                    style: context.textTheme.bodyMedium
                        ?.copyWith(color: Colors.white),
                  ),
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed(
                        RouterHelper.getStartedPage,
                      );
                    },
                    child: const Text(
                      'GET STARTED',
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
