import 'package:flutter/material.dart';
import 'package:food_e/shared/constants/constant_string.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/colors_helper.dart';

class SplashScreen1 extends StatelessWidget {
  const SplashScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Hero(
            tag: foodELogoHeroTag,
            child: Text.rich(
              TextSpan(
                text: 'Food-',
                style: GoogleFonts.bebasNeue(
                    fontSize: 36, color: ColorsHelper.white),
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
        )
      ],
    ));
  }
}
