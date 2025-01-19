import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_e/extensions/context_extension.dart';
import 'package:food_e/model/meal_model.dart';

import '../../../controllers/fav_page_controller.dart';
import '../../../controllers/riverpod_objects/riverpod_objects.dart';
import '../../../helpers/assets_helper.dart';
import '../../../helpers/colors_helper.dart';
import '../../../shared/constants/constant_padding.dart';

class LikedComponentWidget extends ConsumerWidget {
  const LikedComponentWidget({super.key, this.mealModel});

  final MealModel? mealModel;

  @override
  Widget build(BuildContext context, ref) {
    final height = MediaQuery.of(context).size.height;
    final refProviderFavPageController =
        ref.watch<FavPageController>(favPageController);
    return Dismissible(
      key: Key(mealModel?.id! ?? ''),
      direction: DismissDirection.endToStart,
      background: SvgPicture.asset(
        alignment: Alignment.centerRight,
        AssetsHelper.recycleIcon,
      ),
      onDismissed: (direction) {
        if (direction == DismissDirection.endToStart) {
          refProviderFavPageController.removeProductFromFavorites(mealModel!);
        }
      },
      child: SizedBox(
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
                  image: NetworkImage(
                    mealModel?.images?.first ??
                        'https://cdn0.iconfinder.com/data/icons/shift-free/32/Error-512.png',
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
                    mealModel?.name ?? 'Egg Salad',
                    style: context.textTheme.bodyMedium,
                  ),
                  Text(
                    '\$ ${mealModel?.price ?? 46.00}',
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
                  InkWell(
                    onTap: () {
                      refProviderFavPageController
                          .removeProductFromFavorites(mealModel!);
                    },
                    child: Container(
                      padding: pad8All,
                      decoration: BoxDecoration(
                        color: ColorsHelper.alertError,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: SvgPicture.asset(
                        AssetsHelper.recycleIcon,
                      ),
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
      ),
    );
  }
}
