import 'package:flutter/material.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_string.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
  @override
  Widget build(BuildContext context) {
    final canvasHeight = MediaQuery.of(context).size.height;
    final canvasWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: canvasHeight * .06,
            left: canvasWidth * .055,
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
          //Logo end

          Positioned(
            top: canvasHeight * .1,
            child: SizedBox(
              height: canvasHeight - (canvasHeight * .1),
              width: canvasWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text.rich(
                      const TextSpan(
                        text: 'Get',
                        children: [
                          TextSpan(
                            text: ' Started',
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
                      'Get started and enjoy the awesome local food right at your home.',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(RouterHelper.loginPage);
                      },
                      child: const Text(
                        'Login',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(
                          RouterHelper.registerPage,
                        );
                      },
                      child: const Text(
                        'REGISTER',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
