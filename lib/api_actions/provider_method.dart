
import 'package:flutter/material.dart';

import 'api_models.dart';
import 'get_method.dart';

class ProviderProduct extends ChangeNotifier{

  List<Products> _products=[];

  //TODO:getter

  List<Products> get products=>_products;

  //TODO:setter

Future<void> fetchAllProducts()async{
notifyListeners();
final response=await fetchData();
print(response);
_products=response;

notifyListeners();

}
}