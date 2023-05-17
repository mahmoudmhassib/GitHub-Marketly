import 'package:flutter/cupertino.dart';

import 'api_models.dart';

class CartProvider extends ChangeNotifier{
 final  List<Products> _cartProduct=[];
  List<Products> get cartProduct=>_cartProduct;

 addProduct(Products products){
   _cartProduct.add(products);
   notifyListeners();

 }

 deleteProduct(Products products){
   _cartProduct.remove(products);
   notifyListeners();
 }

}