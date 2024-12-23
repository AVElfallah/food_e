import 'package:flutter/material.dart';
import 'package:food_e/helpers/assets_helper.dart';

import '../widgets/meal_recommended_card_widget.dart';

class RecommendedForYouLayout extends StatelessWidget {
  const RecommendedForYouLayout({super.key});

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: canvasWidth,
      height: canvasHeight * .35,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          MealRecommendedCardWidget(
            mealName: 'Egg Salad',
            price: 5,
            mealImagePNGPath: AssetsHelper.mealOfEggImage,
          ),
          MealRecommendedCardWidget(
            mealName: 'Bread',
            price: 15,
            mealImagePNGPath: AssetsHelper.mealOfBreadImage,
          ),
        ],
      ),
    );
  }
}
