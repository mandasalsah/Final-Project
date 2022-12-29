import 'package:flutter/cupertino.dart';

import '../data/repository/apps_repository.dart';
import '../models/product_model.dart';
import '../utils/utils.dart';

class ProductViewModel extends ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<ProductDetailModel> _products = [];
  AppState _appState = AppState.loading;
  final TextEditingController _searchController = TextEditingController();

  List<ProductDetailModel> get products => _products;
  TextEditingController get searchController => _searchController;
  AppState get appState => _appState;

  void fetchProduct(String value) async {
    try {
      changeAppState(AppState.loading);
      _products = await appsRepository.fetchProduct(value);
      notifyListeners();
      changeAppState(AppState.loaded);

      if (_products.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }
}
