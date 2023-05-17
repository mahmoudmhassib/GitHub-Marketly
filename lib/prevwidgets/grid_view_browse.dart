import 'package:flutter/material.dart';
import 'package:marketly/api_actions/api_models.dart';
import 'card_product.dart';
class GridViewBrowse extends StatelessWidget {
  final Products product;

   GridViewBrowse({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CardProduct(product:product ,);
  }
}
