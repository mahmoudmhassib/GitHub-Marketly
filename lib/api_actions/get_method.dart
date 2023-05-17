import 'dart:convert';

import 'package:http/http.dart' as http;

import 'api_models.dart';

//TODO:get all data

Future<List<Products>> fetchData() async {
  final _URl = 'https://marketly.onrender.com/products/all';
  final response = await http.get(Uri.parse(_URl));
  if (response.statusCode == 200) {
    print(response.statusCode);
    List jsdecoder = json.decode(response.body);
    return jsdecoder.map((data) => Products.fromJson(data)).toList();
  } else {
    throw Exception('cant get data');

  }

}
