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
        products.add(MealModel.fromJSON(doc.data() as Map<String, dynamic>));
      }

      return right(products);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }

  // add product to favorites
  Future<Either<ProductErrors, void>> addProductToFavorites(
      MealModel mealModel) async {
    try {
      var uid = getIt.get<AuthFirebaseService>().authService.currentUser!.uid;
      await firestore
          .collection('favorites')
          .doc(uid)
          .collection('')
          .add(mealModel.toJSON());
      return right(null);
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

  // remove product from favorites
  Future<Either<ProductErrors, void>> removeProductFromFavorites(
      MealModel mealModel) async {
    try {
      await firestore
          .collection('favorites')
          .where('id', isEqualTo: mealModel.id)
          .get()
          .then((value) => value.docs.first.reference.delete());
      return right(null);
    } on FirebaseException catch (e) {
      return left(ProductErrors.fromFirebase(e));
    }
  }
}
