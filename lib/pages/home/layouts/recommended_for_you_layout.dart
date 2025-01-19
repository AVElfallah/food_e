import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_e/controllers/home_page_controller.dart';

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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          if (homePageProvider.recommendedProducts.isEmpty)
            const Center(child: CircularProgressIndicator())
          else
            for (var product in homePageProvider.recommendedProducts)
              MealRecommendedCardWidget(
                mealModel: product,
              )
        ],
      ),
    );
  }
}
