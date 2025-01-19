import 'package:flutter/material.dart';
import 'package:food_e/helpers/di_helper.dart';
import 'package:food_e/model/meal_model.dart';

class HomePageController extends ChangeNotifier {
  final recommendedProducts = <MealModel>[];
  Future<void> loadAllProducts(
      {Function? onSuccess, Function(String?)? onError}) async {
    (await DIHelper().productsService.getAllProducts()).fold((l) {
      onError?.call(l.errorMessage);
    }, (r) {
      recommendedProducts.addAll(r);
      notifyListeners();
    });
  }
}
