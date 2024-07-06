import 'dart:convert';

import 'package:flutter/material.dart';
import '../Model/product_model.dart';
import '../Helper Class/api_services.dart';

class HomeProvider extends ChangeNotifier {
  bool isLoading = false;
  List<ProductModel> productModel = [];

  HomeProvider() {
    fetchData();
  }

  Future<void> fetchData() async {
    ApiService apiServices = ApiService();
    _setLoading(true);

    try {
      String? data = await apiServices.apiCalling();
      if (data != null) {
        List<dynamic> list = jsonDecode(data);
        productModel = list.map((e) => ProductModel.fromJson(e)).toList();
      } else {
        // Handle the case when data is null (API call failed)
        productModel = [];
      }
    } catch (e) {
      // Handle any errors during API call or JSON decoding
      print("Error fetching data: $e");
      productModel = [];
    }

    _setLoading(false);
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }
}
