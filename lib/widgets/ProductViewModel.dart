import 'package:flutter/cupertino.dart';
import 'package:bismillahfinalproject/models/api/productapi.dart';
import 'package:bismillahfinalproject/models/Product.dart';

class ProductViewModel with ChangeNotifier {
  final ProductApi productApi = ProductApi();

  List<ProductModel> _listProduct = [];
  List<ProductModel> _listProductByCategory = [];

  List<ProductModel> get listProduct => _listProduct;
  List<ProductModel> get listProductByCategory => _listProductByCategory;

  Future<void> fetchProducts() async {
    try {
      _listProduct = await productApi.getProduct();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchProductByCategoryName(String value) async {
    try {
      _listProductByCategory = await productApi.getProductByCategoryName(value);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
