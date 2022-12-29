import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  late UserModel _user;
  final TextEditingController _addressController = TextEditingController();

  UserModel get user => _user;
  TextEditingController get addressController => _addressController;

  void addUserDetail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    int id = prefs.getInt('userid') ?? 0;
    String name = prefs.getString('name') ?? 'null';
    String handphone = prefs.getString('phone') ?? 'null';
    String email = prefs.getString('email') ?? 'null';

    _user = UserModel(id: id, name: name, email: email, phone: handphone);
    notifyListeners();
  }
}
