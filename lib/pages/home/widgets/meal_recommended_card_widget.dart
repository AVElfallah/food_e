import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/helpers/router_helper.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:food_e/shared/constants/constant_padding.dart';

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
    MealModel meal = MealModel(
      mealName: mealName,
      price: price,
      imageURL: mealImagePNGPath,
    );
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouterHelper.mealPage,
          arguments: meal,
        );
      },
      child: Padding(
        padding: pad4All,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          child: Container(
            width: context.width * .45,
            //margin: pad20All,
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
                  height: context.height * .20,
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
                  padding: pad8All,
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      mealName!,
                      style: context.textTheme.labelMedium?.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
                          style: context.textTheme.headlineSmall?.copyWith(
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
        ),
      ),
    );
  }
}
