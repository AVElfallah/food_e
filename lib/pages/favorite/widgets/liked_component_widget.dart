import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';

class LikedComponentWidget extends StatelessWidget {
  const LikedComponentWidget(
      {super.key, this.assetImage, this.name, this.price});
  final String? assetImage;
  final String? name;
  final double? price;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: height * .15,
      child: Row(
        children: [
          //image [START]
          Container(
            width: 100,
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: AssetImage(
                  assetImage ?? AssetsHelper.mealOfEggImage,
                ),
                fit: BoxFit.fill,
              ),
            ),
          ),

          //image [END]

          // price and name column [START]
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name ?? 'Egg Salad',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: ColorsHelper.light,
                  ),
                ),
                Text(
                  '\$ ${price ?? 46.00}',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 24,
                    color: ColorsHelper.primary,
                  ),
                ),
              ],
            ),
          )
          //price and name column [END]
          ,
          const Spacer(),
          //count and delete button column [START]
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: ColorsHelper.alertError,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    AssetsHelper.recycleIcon,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: ColorsHelper.primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    AssetsHelper.basketIcon,
                  ),
                ),
              ],
            ),
          )
          //count and delete button [END]
        ],
      ),
    );
  }
}
