import 'package:flutter/material.dart';
import 'package:online_grocery_app/data/model/products_model.dart';
import 'package:online_grocery_app/data/model/single_product_model.dart';
import 'package:online_grocery_app/data/services/urls.dart';
import '../../data/services/networkCaller.dart';

class ProductControllerr extends ChangeNotifier {
  final NetworkCaller networkCaller = NetworkCaller();
bool isLoading = false;
  List<Products> allProducts = [];
  List<Products> featuredProducts = [];
  List<Products> searchProductList = [];

  SingleProductModel? singleProduct;

  //  All Products Fetch
  Future<void> getProducts() async {
    try {
      final response = await NetworkCaller.GetRequest(url: Urls.allproductsUrl);
      if (response.isSuccess) {
        final jsonProducts = response.body!["data"]["products"] as List;
        allProducts = jsonProducts.map((p) => Products.fromJson(p)).toList();
        notifyListeners();
      } else {
        throw Exception('Something went wrong!');
      }
    } catch (e) {
      print('getProducts Error: $e');
    }
  }

  // Single Product Fetch
  Future<void> getSingleProduct(int id) async {
    try {
      final response = await NetworkCaller.GetRequest(
        url: Urls.getSingleproductsUrl(id),
      );

      if (response.isSuccess) {
        //  JSON structure অনুযায়ী parse করতে হবে data["product"]
        final jsonProduct = response.body!["data"]["product"];
        singleProduct = SingleProductModel.fromJson(jsonProduct);
        notifyListeners();
      } else {
        throw Exception('Something went wrong');
      }
    } catch (e) {
      print('getSingleProduct Error: $e');
    }
  }

  //search prodcut item
  Future<void> searchProduct(String query) async {
    try {
      final response = await NetworkCaller.GetRequest(
        url: Urls.searchItemUrl(query),
      );

      if (response.isSuccess) {
        final productListJson = response.body!['data']['products'] as List;
        searchProductList = productListJson
            .map((e) => Products.fromJson(e))
            .toList();

        notifyListeners();
      } else {
        searchProductList = [];
        notifyListeners();
      }
    } catch (e) {
      print('Search Error: $e');
      searchProductList = [];
      notifyListeners();
    }
  }


}
