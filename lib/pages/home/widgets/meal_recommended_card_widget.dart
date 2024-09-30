import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';

class MealRecommendedCardWidget extends StatelessWidget {
  const MealRecommendedCardWidget({
    super.key,
    this.price = 5,
    this.mealName = 'no name',
    this.mealImagePNGPath = AssetsHelper.mealOfBreadImage,
  });
  final double? price;
  final String? mealName;
  final String? mealImagePNGPath;

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    MealModel meal = MealModel(
      mealName: mealName,
      price: price,
      imageURL: mealImagePNGPath,
    );
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouterHelper.mealPage,
          arguments: meal,
        );
      },
      child: Container(
        height: canvasHeight * .30,
        width: canvasWidth * .45,
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Container(
              height: canvasHeight * .20,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: DecorationImage(
                  image: AssetImage(
                    mealImagePNGPath!,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton.filled(
                  onPressed: () {},
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white24,
                    highlightColor: Colors.red,
                  ),
                  icon: SvgPicture.asset(
                    AssetsHelper.heartIcon,
                    fit: BoxFit.cover,
                    height: 23,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  mealName!,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 10),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '\$${price!.toStringAsFixed(2)}',
                      style: GoogleFonts.bebasNeue(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: ColorsHelper.primary,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 2, bottom: 15),
                  child: IconButton.filled(
                    onPressed: () {},
                    icon: SvgPicture.asset(
                      AssetsHelper.basketIcon,
                      fit: BoxFit.cover,
                      height: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 2,
            )
          ],
        ),
      ),
    );
  }
}
