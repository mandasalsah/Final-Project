import 'package:bismillahfinalproject/models/Product.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductApi {
  Future<List<ProductModel>> getProduct() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse('https://api1.sib3.nurulfikri.com/api/barang');

    String token = prefs.getString('token')!;
    var response = await http.get(
      url,
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );
    final responseBody = json.decode(response.body)['data'];
    final listOfProducts =
        (responseBody as List).map((e) => ProductModel.fromJson(e)).toList();
    print(json.decode(response.body));

    if (response.statusCode == 200) {
      print(json.decode(response.body));
    } else {
      print(json.decode(response.body));
    }
    return listOfProducts;

    // try {
    // } catch (e) {
    //   print(e.toString());
    // }
  }

  Future<List<ProductModel>> getProductByCategoryName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Uri url = Uri.parse('https://api1.sib3.nurulfikri.com/api/barang');

    String token = prefs.getString('token')!;
    final response = await http.get(
      url,
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );
    final responseBody = json.decode(response.body)['data'];
    final listOfProducts =
        (responseBody as List).map((e) => ProductModel.fromJson(e)).toList();

    return listOfProducts
        .where((element) => element.category.name.toLowerCase().contains(value))
        .toList();

    // try {
    // } catch (e) {
    //   print(e.toString());
    // }
  }
}
