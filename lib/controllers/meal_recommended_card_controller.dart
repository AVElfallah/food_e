import 'package:flutter/material.dart';
import 'package:food_e/helpers/di_helper.dart';
import 'package:food_e/model/meal_model.dart';

class MealRecommendedCardController extends ChangeNotifier {
  MealRecommendedCardController(this.model) {
    Future(() async {
      (await DIHelper().productsService.checkIfProductInFavorites(model)).fold(
          (l) {
        isFavorite = false;
        notifyListeners();
      }, (r) {
        isFavorite = r;
        notifyListeners();
      });
    });
  }
  final MealModel model;

  bool isFavorite = false;

  addToCart() {
    // todo add to cart
  }

  changeFavoriteState(
    MealModel model,
  ) async {
    if (!isFavorite) {
      (await DIHelper().productsService.addProductToFavorites(model))
          .fold((l) {}, (r) {
        isFavorite = true;
        notifyListeners();
      });
    } else {
      (await DIHelper().productsService.removeProductFromFavorites(model))
          .fold((l) {}, (r) {
        isFavorite = false;
        notifyListeners();
      });
    }
  }
}
