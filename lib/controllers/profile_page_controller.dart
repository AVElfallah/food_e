import 'package:flutter/material.dart';

import '../helpers/di_helper.dart';

class ProfilePageController extends ChangeNotifier {
  // Sign out function
  void singout({Function? onSuccess, Function(String?)? onError}) async {
    (await DIHelper.instance.authService.signOut()).fold(
      (l) {
        onError?.call(l.errorMessage) ?? debugPrint(l.errorMessage);
      },
      (r) {
        onSuccess?.call();
      },
    );
    notifyListeners();
  }
  //
}
