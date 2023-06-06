import 'package:flutter/material.dart';

class ButtomNavProvider extends ChangeNotifier {
  int _currenIndex = 0;
  String _title = 'First';

  // getter
  int get currentIndex => _currenIndex;
  String get title => _title;

  // update index
  void updateIndex(int index) {
    _currenIndex = index;
    switch (index) {
      case 0:
        _title = 'First';
        break;
      case 1:
        _title = 'Second';
        break;
      case 2:
        _title = 'Third';
        break;
    }
    notifyListeners();
  }
}
