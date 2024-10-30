import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/extensions/context_extension.dart';

import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_padding.dart';

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
            margin: pad8All,
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
            padding: pad12All,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name ?? 'Egg Salad',
                  style: context.textTheme.bodyMedium,
                ),
                Text(
                  '\$ ${price ?? 46.00}',
                  style: context.textTheme.headlineMedium
                      ?.copyWith(color: ColorsHelper.primary),
                ),
              ],
            ),
          )
          //price and name column [END]
          ,
          const Spacer(),
          //count and delete button column [START]
          Padding(
            padding: pad12All,
            child: Column(
              children: [
                Container(
                  padding: pad8All,
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
                  padding: pad6All,
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
