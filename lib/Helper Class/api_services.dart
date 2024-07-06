import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Model/product_model.dart';

class ApiService {
  // Endpoint URL for the fake store API
  final String apiUrl = "https://fakestoreapi.com/products";

  // Method to make the API call and return the response body as a string
  Future<String?> apiCalling() async {
    try {
      Uri uri = Uri.parse(apiUrl);
      Response response = await http.get(uri);

      if (response.statusCode == 200) {
        print("------------ API call successful --------------------");
        return response.body;
      } else {
        print("------------ API call failed with status: ${response.statusCode} --------------------");
        return null;
      }
    } catch (e) {
      print("------------ API call failed with error: $e --------------------");
      return null;
    }
  }

  // Method to fetch products and parse the JSON response into a list of ProductModel objects
  Future<List<ProductModel>> fetchProducts() async {
    String? responseBody = await apiCalling();

    if (responseBody != null) {
      List<dynamic> decodedJson = jsonDecode(responseBody);
      List<ProductModel> products = decodedJson.map((json) => ProductModel.fromJson(json)).toList();
      return products;
    } else {
      return [];
    }
  }
}
