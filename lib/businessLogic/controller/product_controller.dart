import 'package:flutter/material.dart';
import 'package:online_grocery_app/data/model/products_model.dart';
import 'package:online_grocery_app/data/services/urls.dart';

import '../../data/services/networkCaller.dart';

class ProductControllerr extends ChangeNotifier{
  final NetworkCaller networkCaller = NetworkCaller();
  
  List<Products> allProducts = [];
  List<Products> featuredProducts = [];

  Products ? singleProduct;
  
      
      //calling for products

Future<void> getProducts()async{
    try{
      final response = await NetworkCaller.getAllProducts(url: Urls.allproductsUrl);
      if(response.isSuccess){
        final jsonProdcuts = response.body!["data"]["products"] as List;
        allProducts = jsonProdcuts.map((p)=>Products.fromJson(p)).toList();
        notifyListeners();

      }
      else{
        throw Exception('Something wrong!');
      }
    }catch(e){
      print(e.toString());
    }
}


  // Single product
  Future<void> getSingleProduct(int id) async {
    try {
      final response = await NetworkCaller.getAllProducts(url: Urls.getSingleproductsUrl(id));
      if(response.isSuccess){
        final jsonProduct = response.body!["data"]; // Single product
        singleProduct = Products.fromJson(jsonProduct);
        notifyListeners();
      } else {
        throw Exception('Something went wrong!');
      }
    } catch(e) {
      print(e.toString());
    }
  }

}