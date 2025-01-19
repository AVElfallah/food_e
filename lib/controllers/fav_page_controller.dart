import 'package:flutter/material.dart';
import 'package:food_e/helpers/di_helper.dart';

import '../model/meal_model.dart';

class FavPageController extends ChangeNotifier {
  FavPageController() {
    getProducts();
  }
  List<MealModel> products = []; // <MealModel>
  bool isInit = false;

  getProducts() async {
    (await DIHelper().productsService.getAllProductsInFavorites()).fold((l) {
      print(l.errorMessage);
      products = [];
    }, (r) {
      products = r;
      print(r);
      notifyListeners();
    });
  }

  removeProductFromFavorites(MealModel mealModel) async {
    (await DIHelper().productsService.removeProductFromFavorites(mealModel))
        .fold((l) {
      print(l.errorMessage);
    }, (r) {
      products.remove(mealModel);
      notifyListeners();
    });
  }
}
