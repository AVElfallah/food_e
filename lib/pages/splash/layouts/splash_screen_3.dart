import 'package:flutter/material.dart';
import 'package:food_e/helpers/assets_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/colors_helper.dart';
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
                  style: GoogleFonts.bebasNeue(
                      fontSize: 20, color: ColorsHelper.white),
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
                    style: GoogleFonts.bebasNeue(
                      color: Colors.white,
                      fontSize: 34,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(22),
                  child: Text(
                    'Fresh and delicious local food delivered from the restaurants to your doorstep',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
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
