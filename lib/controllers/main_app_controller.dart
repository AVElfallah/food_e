import 'package:flutter/material.dart';
import 'package:food_e/helpers/di_helper.dart';

class MainAppController extends ChangeNotifier {
  bool isDarkMode = DIHelper().appInternalData.getDarkMode();

  /// Toggles the app's dark mode on or off.
  ///
  /// Also saves the preference to the device's local storage.
  ///
  void changeDarkMode() {
    isDarkMode = !isDarkMode;
    // Todo inject AppInternalData and saveDarkMode
    DIHelper().appInternalData.saveDarkMode(isDarkMode);
    notifyListeners();
  }
}
