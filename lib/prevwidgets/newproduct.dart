import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_actions/provider_method.dart';
import 'card_product.dart';
class NewProduct extends StatelessWidget {
  String title;
  String productType;
  String productPrice;
  String productImage;
   NewProduct({Key? key,required this.title,required this.productType,required this.productPrice,required this.productImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin:const EdgeInsets.only(left: 15,bottom: 15,right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                width: 90,
                height: 23,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Theme.of(context).primaryColor,
                ),
                child:const Center(
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 230,
          child: Consumer<ProviderProduct>(
            builder: (ctx,value,child){
              final prov=value.products;
              if(prov.isNotEmpty){
                return ListView.builder(
                  padding:const EdgeInsets.only(left: 15,bottom: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: prov.length,
                  itemBuilder: (ctx,index) {
                    return CardProduct(product: prov[index],);
                  },
                );
              }else{
                return const SizedBox(height:20,width:20,child: Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ));
              }

            },
          ),
        ),
      ],
    );
  }
}
