import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/model/meal_model.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';
import '../../../helpers/router_helper.dart';
import '../../../shared/constants/constant_padding.dart';

class SearchCardResultWidget extends StatelessWidget {
  const SearchCardResultWidget(
      {super.key,
      required this.mealModel,
      required this.height,
      required this.width});
  final MealModel mealModel;
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouterHelper.mealPage,
          arguments: mealModel,
        );
      },
      child: SizedBox(
        height: height,
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: NetworkImage(
                          mealModel.images!.first,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton.filled(
                        onPressed: () {},
                        style: IconButton.styleFrom(
                          backgroundColor: ColorsHelper.gray,
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
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: pad8All,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                mealModel.name ?? 'Meal Name',
                                style: context.textTheme.labelMedium?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, bottom: 10),
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    '\$${mealModel.price?.toStringAsFixed(2)}',
                                    style: context.textTheme.headlineSmall
                                        ?.copyWith(
                                      color: ColorsHelper.primary,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 2, bottom: 15),
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
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
