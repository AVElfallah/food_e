import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';

class ErrorOrderPage extends StatelessWidget {
  const ErrorOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: ColorsHelper.alertError,
      body: Stack(
        children: [
          //Content [START]
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: height * .68,
              width: double.infinity,
              child: Flex(
                direction: Axis.vertical,
                children: [
                  //Page Text Message [START]
                  Text(
                    'SOMETHING WENT WRONG!',
                    style: GoogleFonts.bebasNeue(
                      fontSize: 36,
                      color: Colors.white,
                    ),
                  ),

                  //Page Text Message [END]
                  const SizedBox(
                    height: 50,
                  ),

                  //Page Image [START]
                  const CircleAvatar(
                    radius: 80,
                    backgroundColor: ColorsHelper.primaryLight,
                    backgroundImage: AssetImage(
                      AssetsHelper.astroCheck,
                    ),
                  ),
                  //Page Image [END]
                  const SizedBox(
                    height: 50,
                  ),
                  //Details [START]
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Something went wrong. We’ll look into the issue right away.',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  //Details [END]
                  const Spacer(),
                  //Track order button [START]
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsHelper.dark,
                      foregroundColor: ColorsHelper.alertSuccess,
                    ),
                    child: const Text(
                      'TRY AGAIN',
                    ),
                  ),
                  //Track order button [END]
                  SizedBox(
                    height: height * .1,
                  )
                ],
              ),
            ),
          )
          //Content [END]
        ],
      ),
    );
  }
}
