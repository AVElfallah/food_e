import 'package:flutter/material.dart';

class SplashPageController extends ChangeNotifier {
  int _screenNumber = 0;
  int get screenNumber => _screenNumber;

  void toNextScreen() {
    _screenNumber++;
    notifyListeners();
  }
}
