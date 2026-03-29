import 'package:flutter/material.dart';

class RootController extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void setCurrentIndex(int index) {
    try {
      _currentIndex = index;
      notifyListeners();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
