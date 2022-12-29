import 'package:flutter/cupertino.dart';

class CheckoutViewModel extends ChangeNotifier {
  String _alamat = "";
  String get alamat => _alamat;

  Future<void> changeAlamat(String value) async {
    _alamat = value;
    notifyListeners();
  }

  void resetAlamat() {
    _alamat = "";
    notifyListeners();
  }
}
