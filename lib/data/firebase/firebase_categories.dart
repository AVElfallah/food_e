import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_e/model/category_model.dart';

class FirebaseCategoriesService {
  // FireStore instance
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  // get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    var categories = await firestore.collection('categories').get();
    return categories.docs
        .map((e) =>
            CategoryModel.fromJSON(e.data()).copyWith(id: "categories/${e.id}"))
        .toList();
  }
}
