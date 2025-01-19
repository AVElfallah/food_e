import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_e/data/firebase/auth_firebase.dart';
import 'package:food_e/errors/product_errors.dart';
import 'package:food_e/helpers/di_helper.dart';
import 'package:food_e/model/meal_model.dart';
import 'package:fpdart/fpdart.dart';

class FirebaseProductsService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Either<ProductErrors, List<MealModel>>> getAllProducts() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('products').get();
      var products = <MealModel>[];
      for (var doc in snapshot.docs) {
        products.add(MealModel.fromJSON(doc.data() as Map<String, dynamic>)
            .copyWith(id: doc.id));
      }

      return right(products);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

  // add product to cart
  Future<Either<ProductErrors, void>> addProductToCart(
      MealModel mealModel) async {
    try {
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;

      await firestore
          .collection('cart')
          .doc(uid)
          .collection('')
          .add(mealModel.toJSON());

      return right(null);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

//[Start] Favorites Section
  /// this section is for favorites products to be handled
  // add product to favorites
  Future<Either<ProductErrors, void>> addProductToFavorites(
      MealModel mealModel) async {
    try {
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
      await firestore.collection('favorites').doc(uid).update({
        'ids': FieldValue.arrayUnion([mealModel.id])
      });
      return right(null);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

  // remove product from favorites
  Future<Either<ProductErrors, void>> removeProductFromFavorites(
      MealModel mealModel) async {
    try {
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
      var snapshot = await firestore.collection('favorites').doc(uid).update({
        'ids': FieldValue.arrayRemove([mealModel.id])
      });
      snapshot;
      return right(null);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

  // check if product is in favorites
  Future<Either<ProductErrors, bool>> checkIfProductInFavorites(
      MealModel mealModel) async {
    try {
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
      var snapshot = await firestore.collection('favorites').doc(uid).get();

      List data = await snapshot.get('ids');
      if (data.contains(mealModel.id)) return right(true);

      return right(false);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

// get all products in favorites
  Future<Either<ProductErrors, List<MealModel>>>
      getAllProductsInFavorites() async {
    try {
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
      var snapshot = await firestore.collection('favorites').doc(uid).get();
      // get ids
      List data = await snapshot.get('ids');
      // init products list that will fills from products collections using ids in favorites
      List<MealModel> products = [];
      for (var id in data) {
        var product = await firestore.collection('products').doc(id).get();
        products.add(MealModel.fromJSON(product.data() as Map<String, dynamic>)
            .copyWith(id: product.id));
      }
      return right(products);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

  ///
  ///[End] Section
}
