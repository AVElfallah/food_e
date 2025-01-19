import 'package:flutter/material.dart';
import 'package:food_e/helpers/di_helper.dart';
import 'package:food_e/model/meal_model.dart';

class HomePageController extends ChangeNotifier {
  final recommendedProducts = <MealModel>[];

  bool noRecommendationData = false;

  String userName =
      DIHelper().authService.authService.currentUser?.displayName ?? '';

  bool isEmpty() => recommendedProducts.isEmpty;
  Future<void> loadAllProducts(
      {Function? onSuccess, Function(String?)? onError}) async {
    (await DIHelper().productsService.getAllProducts()).fold((l) {
      onError?.call(l.errorMessage);
      noRecommendationData = true;
      notifyListeners();
    }, (r) {
      recommendedProducts.addAll(r);
      if (recommendedProducts.isEmpty) noRecommendationData = true;
      notifyListeners();
    });
  }
}
