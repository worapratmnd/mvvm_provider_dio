import 'package:flutter/material.dart';

class ButtomNavProvider extends ChangeNotifier {
  int _currenIndex = 0;
  String _title = 'Users';

  // getter
  int get currentIndex => _currenIndex;
  String get title => _title;

  // update index
  void updateIndex(int index) {
    _currenIndex = index;
    switch (index) {
      case 0:
        _title = 'Users';
        break;
      case 1:
        _title = 'Products';
        break;
      case 2:
        _title = 'Maps';
        break;
    }
    notifyListeners();
  }
}
