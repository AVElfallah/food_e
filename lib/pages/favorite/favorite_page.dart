import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/assets_helper.dart';
import '../../helpers/colors_helper.dart';
import '../../shared/layouts/shared_bottom_nav_layout.dart';
import 'widgets/liked_component_widget.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          //AppBar [START]
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                'LIKED',
                style: GoogleFonts.bebasNeue(
                  fontSize: 36,
                  color: ColorsHelper.light,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
          //AppBar [END]

          // Basket body [START]
          Container(
            height: height * .6,
            margin: EdgeInsets.only(top: height * .14),
            child: ListView(
              children: const [
                LikedComponentWidget(
                  price: 5,
                ),
                LikedComponentWidget(
                  assetImage: AssetsHelper.mealOfBreadImage,
                  price: 60,
                  name: 'Grilled Salmon',
                ),
              ],
            ),
          ),

          //Basket body [END]
        ],
      ),
      bottomNavigationBar: const SharedBottomNavLayout(currentIndex: 3),
    );
  }
}
