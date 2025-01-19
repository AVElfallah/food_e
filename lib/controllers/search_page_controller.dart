import 'package:flutter/material.dart';
import 'package:food_e/data/firebase/firebase_search.dart';
import 'package:food_e/helpers/di_helper.dart';

import '../data/firebase/firebase_categories.dart';
import '../model/category_model.dart';
import '../model/meal_model.dart';

class SearchPageController extends ChangeNotifier {
  SearchPageController() {
    // load categories
    getIt.get<FirebaseCategoriesService>().getAllCategories().then((value) {
      categories = value;
      notifyListeners();
    });

    //search history
    getIt.get<FirebaseSearchService>().getSearchHistory().then((value) {
      searchHistory = value;
      notifyListeners();
    });

    // init focus node
    fNode = FocusNode();
    fNode.addListener(() {
      if (fNode.hasFocus) {
        searchBoxIsFocused = true;
        notifyListeners();
      } else {
        searchBoxIsFocused = false;

        notifyListeners();
      }
    });
  }
  TextEditingController searchController = TextEditingController();
  late final FocusNode fNode;

  bool searchBoxIsFocused = false;
  bool isSearchQueryEmpty = true;

  List<CategoryModel> categories = [];
  List<CategoryModel> selectedCategories = [];
  List<String> searchHistory = [];
  List<MealModel> searchResult = [];

  void clearSelectedCategories() {
    selectedCategories.clear();
    notifyListeners();
  }

  void selectQueryFromSearchHistory(String query) {
    searchController.text = query;
    fNode.requestFocus();
    searchForProduct();
  }

  void selectCategory(CategoryModel category) {
    selectedCategories.clear();
    selectedCategories.add(category);

    notifyListeners();
  }

  void clearAllSearchHistory() async {
    await getIt.get<FirebaseSearchService>().clearSearchHistory();
    searchHistory = [];
    notifyListeners();
  }

  void clearElementFromSearchHistory(String query) async {
    await getIt.get<FirebaseSearchService>().removeSearchHistory(query);
    searchHistory.remove(query);
    notifyListeners();
  }

  void searchForProduct() async {
    if (searchController.text.isNotEmpty) {
      if (selectedCategories.isNotEmpty) {
        searchResult = await getIt
            .get<FirebaseSearchService>()
            .searchProductsByNameAndCategory(
                searchController.text, selectedCategories.first);

        searchHistory =
            await getIt.get<FirebaseSearchService>().getSearchHistory();
        print(searchResult);
        notifyListeners();
      } else {
        searchResult = await getIt
            .get<FirebaseSearchService>()
            .searchProductsByName(searchController.text);
        print(searchResult);
        searchHistory =
            await getIt.get<FirebaseSearchService>().getSearchHistory();
        print(searchHistory);
        notifyListeners();
      }
    } else {
      searchResult = [];
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchController.dispose();
    fNode.dispose();
    super.dispose();
  }
}
