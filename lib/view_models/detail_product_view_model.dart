import 'package:flutter/cupertino.dart';

class DetailProductViewModel extends ChangeNotifier {
  int _index = 0;

  final List _selectColor = [
    "Green",
    "Black",
    "Silver",
    "Blue",
  ];

  List get selectColor => _selectColor;
  int get index => _index;

  void changeIndex(int index) {
    _index = index;
    notifyListeners();
  }
}
