import 'package:food_e/data/firebase/auth_firebase.dart';
import 'package:food_e/data/firebase/firebase_products.dart';
import 'package:food_e/data/firebase/firebase_search.dart';
import 'package:get_it/get_it.dart';

import '../data/app_internal_data.dart';
import '../data/firebase/firebase_categories.dart';
import '../data/firebase/rest_password_firebase.dart';

final GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<AppInternalData>(AppInternalData());
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseService());
  getIt.registerSingleton<RestPasswordFirebaseService>(
      RestPasswordFirebaseService());
  getIt.registerSingleton<FirebaseProductsService>(FirebaseProductsService());

  getIt.registerSingleton<FirebaseSearchService>(FirebaseSearchService());
  getIt.registerSingleton<FirebaseCategoriesService>(
      FirebaseCategoriesService());
}

class DIHelper {
  DIHelper._();
  static final DIHelper instance = DIHelper._();
  factory DIHelper() => instance;

  final appInternalData = getIt.get<AppInternalData>();
  final authService = getIt.get<AuthFirebaseService>();
  final restPasswordService = getIt.get<RestPasswordFirebaseService>();
  final productsService = getIt.get<FirebaseProductsService>();

  final searchService = getIt.get<FirebaseSearchService>();
  final categoriesService = getIt.get<FirebaseCategoriesService>();
}
