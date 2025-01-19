import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_e/helpers/di_helper.dart';
import 'package:food_e/model/category_model.dart';
import 'package:food_e/model/meal_model.dart';

import 'auth_firebase.dart';

class FirebaseSearchService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// search for products by name
  Future<List<MealModel>> searchProductsByName(String name) async {
    // get products to search in
    var products = await _firestore.collection('products').get();
    // update search history add search process to it
    var testif = await _updateSearchHistory(name);
    print('testif $testif');

    // do search in products and return the result as list of MealModel
    return products.docs
        .where((element) => element['name']
            .toString()
            .toLowerCase()
            .contains(name.toLowerCase()))
        .map((e) => MealModel.fromJSON(e.data()).copyWith(id: e.id))
        .toList();
  }

// search for products by name and category
  Future<List<MealModel>> searchProductsByNameAndCategory(
      String name, CategoryModel category) async {
    // get products to search in
    var products = await _firestore.collection('products').get();
    // update search history add search process to it
    _updateSearchHistory(name);

    // do search in products and return the result as list of MealModel
    return products.docs
        .where((element) =>
            element['name']
                .toString()
                .toLowerCase()
                .contains(name.toLowerCase()) &&
            element['category_id'] == category.id)
        .map((e) => MealModel.fromJSON(e.data()).copyWith(id: e.id))
        .toList();
  }

  // get search history
  Future<List<String>> getSearchHistory() async {
    var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
    var snapshot = await _firestore.collection('search_history').doc(uid).get();
    return snapshot.data() != null
        ? List<String>.from(snapshot.data()!['history'])
        : [];
  }

  // update search history
  Future<bool> _updateSearchHistory(String search) async {
    var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;

    try {
      await _firestore.collection('search_history').doc(uid).update({
        'history': FieldValue.arrayUnion([search])
      });

      return true;
    } on FirebaseException catch (e) {
      if (e.code == 'not-found') {
        await _firestore.collection('search_history').doc(uid).set({
          'history': [search]
        });
        return true;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  // clear entire search history
  Future<void> clearSearchHistory() async {
    var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
    await _firestore
        .collection('search_history')
        .doc(uid)
        .update({'history': []});
  }

  // remove element from search history
  Future<bool> removeSearchHistory(String id) async {
    try {
      // get user id
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
      // remove element from search history
      await _firestore.collection('search_history').doc(uid).update({
        'history': FieldValue.arrayRemove([id])
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
