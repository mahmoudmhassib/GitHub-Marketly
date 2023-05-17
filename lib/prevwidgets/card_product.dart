import 'package:flutter/material.dart';
import 'package:marketly/appscreen/product_details.dart';

import '../api_actions/api_models.dart';

class CardProduct extends StatelessWidget {
  final Products product;
   CardProduct({Key? key,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print('444444');
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProductDetails(product:product ,)));
      },
      child:  Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin:const EdgeInsets.only(right: 8),
            child: Column(
              children: [
                Container(
                  width: 180,
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius:const BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20) ,),
                    image: DecorationImage(
                      image:NetworkImage(product.images![0]),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  width: 170,
                  margin:const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title!,
                        style:const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Row(
                              children: [
                                 Container(
                                  width:30,
                                  height:30,
                                  margin:const EdgeInsets.only(right: 8,top: 10),
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).primaryColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child:const Center(
                                    child: Text(
                                      'T',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Tradly',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              '\$${product.price}',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

    );
  }
}
