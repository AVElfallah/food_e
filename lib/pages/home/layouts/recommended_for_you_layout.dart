import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/home_page_controller.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../controllers/riverpod_objects/riverpod_objects.dart';
import '../widgets/meal_recommended_card_widget.dart';

class RecommendedForYouLayout extends ConsumerStatefulWidget {
  const RecommendedForYouLayout({super.key});
  @override
  ConsumerState<RecommendedForYouLayout> createState() =>
      _RecommendedForYouLayoutState();
}

class _RecommendedForYouLayoutState
    extends ConsumerState<RecommendedForYouLayout> {
  @override
  void initState() {
    super.initState();
    // load all products from network
    ref.read(homePageController).loadAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    var canvasWidth = MediaQuery.of(context).size.width;
    var canvasHeight = MediaQuery.of(context).size.height;
    final homePageProvider = ref.watch<HomePageController>(homePageController);
    return SizedBox(
      width: canvasWidth,
      height: canvasHeight * .35,
      // add skeleton
      child: Skeletonizer(
          enabled: homePageProvider.isEmpty(),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: homePageProvider.isEmpty()
                  ? 3
                  : homePageProvider.recommendedProducts.length,
              itemBuilder: (context, index) {
                // if empty show skeleton
                // this skeleton will be replaced with real data after loading

                return MealRecommendedCardWidget(
                  mealModel: homePageProvider.isEmpty()
                      ? MealModel()
                      : homePageProvider.recommendedProducts[index],
                );
              })),
    );
  }
}
