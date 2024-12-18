import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../pages/splash/controllers/splash_page_controller.dart';

class RiverpodObjects {
  RiverpodObjects._() {
    splashPageControllerProvider =
        ChangeNotifierProvider((ref) => SplashPageController());
  }

  late final splashPageControllerProvider;

  static final RiverpodObjects _instance = RiverpodObjects._();
  factory RiverpodObjects.init() => _instance;
}
