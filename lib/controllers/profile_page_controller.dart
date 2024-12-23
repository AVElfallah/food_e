import 'package:flutter/material.dart';

import '../data/firebase/auth_firebase.dart';

class ProfilePageController extends ChangeNotifier {
  // Sign out function
  void singout({Function? onSuccess, Function(String?)? onError}) async {
    (await AuthFirebaseService().signOut()).fold(
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
