import 'package:food_e/data/firebase/auth_firebase.dart';
import 'package:get_it/get_it.dart';

import '../data/app_internal_data.dart';

final GetIt getIt = GetIt.instance;

void serviceLocatorInit() {
  getIt.registerSingleton<AppInternalData>(AppInternalData());
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseService());
}

class DIHelper {
  DIHelper._();
  static final DIHelper instance = DIHelper._();
  factory DIHelper() => instance;

  final appInternalData = getIt.get<AppInternalData>();
  final authService = getIt.get<AuthFirebaseService>();
}
