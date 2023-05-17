import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketly/api_actions/api_models.dart';
import 'package:marketly/api_actions/Cart_provider.dart';
import 'package:provider/provider.dart';

import 'mycart.dart';

class ProductDetails extends StatefulWidget {
  final Products product;
   ProductDetails({Key? key,required this.product}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value:const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.black,
        statusBarIconBrightness: Brightness.dark
      ),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .431,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(
                      children: [
                        Container(
                width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *.31,
          child: Image.network(
            widget.product.images![0],
            fit: BoxFit.cover,
          ),
        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          margin:const EdgeInsets.only(left: 10,right: 10,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                padding:const EdgeInsets.only(left: 1,right: 10,top: 1,bottom: 3),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Theme.of(context).primaryColor.withOpacity(.50),
                                ),
                                child: Center(
                                  child: IconButton(
                                    icon:const Icon(Icons.arrow_back,color: Colors.white,size: 28,),
                                    onPressed: (){Navigator.of(context).pop();},
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor.withOpacity(.50),
                                    ),
                                    child: Center(
                                      child:  IconButton(
                                        icon:const Icon(Icons.share,color: Colors.white,),
                                        onPressed: (){},
                                      ),
                                    ),
                                  ),
                                   Container(
                                        width: 45,
                                        height: 45,
                                        margin:const EdgeInsets.only(left: 10,right: 10),
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Theme.of(context).primaryColor.withOpacity(.50),
                                        ),
                                        child: Center(
                                          child: IconButton(
                                            icon: Icon(Icons.favorite_border,color: Colors.white,),
                                            onPressed: (){
                                              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>MyCart()));
                                            },
                                          ),
                                        ),
                                  ),
                                  Container(
                                    width: 45,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Theme.of(context).primaryColor.withOpacity(.50),
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon:const Icon(Icons.menu,color: Colors.white,),
                                        onPressed: (){},
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
                    Container(
                      margin:const EdgeInsets.only(top:5,left: 20,bottom: 10),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.product.title!,
                            style:const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ),
                          ),
                          Container(
                            width: 100,
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '\$${widget.product.price}',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                 Text('\$${widget.product.oldPrice}',
                                        style:const TextStyle(
                                            decoration: TextDecoration.lineThrough,
                                            fontSize: 15
                                        ),
                                      ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *.14,
                color: Colors.white,
                margin:const EdgeInsets.only(top: 15,bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            margin:const EdgeInsets.only(left: 20,right: 20),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                't'.toUpperCase(),
                                style:const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30
                                ),
                              ),
                            ),

                          ),
                          const  Text(
                            'Tradly Store',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black54
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 105,
                      height: 30,
                      margin:const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColor,
                      ),
                      child:const Center(
                        child: Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                              padding:const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              height:MediaQuery.of(context).size.height *.25 ,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Text(
                                     '${widget.product.details}' ,
                                  style:const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            ),

                        InkWell(
                            onTap: (){
                             Provider.of<CartProvider>(context,listen: false).addProduct(widget.product);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width *.7,
                              height: 40,
                              margin:const EdgeInsets.only(bottom: 10,top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Theme.of(context).primaryColor,
                              ),
                              child: Center(
                                child: Text(
                                  'Add To Card',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),

                      ),
                      GestureDetector(
                        onTap: (){
                          print('66666666');
                          showModalBottomSheet(
                              context: context,
                              builder: (context){
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height *.5,
                                  child:Column(
                                    children: [
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height *.1,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *.7,
                                              height: 40,
                                              margin:const EdgeInsets.only(bottom: 10,top: 10),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Theme.of(context).primaryColor,
                                              ),
                                              child:const Center(
                                                child: Text(
                                                  'Add To Card',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width *.5,
                                              height: 3,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(50),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height *.21,
                                        margin:const EdgeInsets.only(bottom: 10,top: 5),
                                        color: Colors.white,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width *.5,
                                                height: MediaQuery.of(context).size.height,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children:const [
                                                    Text('Condition',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                                    Text('Price type',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                                    Text('Category',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                                    Text('Location',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                                  ],
                                                ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width *.5,
                                              height: MediaQuery.of(context).size.height,
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                children:const [
                                                  Text('Organic',style: TextStyle(fontSize: 20,color: Colors.black87),),
                                                  Text('Fixed',style: TextStyle(fontSize: 20,color: Colors.black87),),
                                                  Text('Beverages',style: TextStyle(fontSize: 20,color: Colors.black87),),
                                                  Text('Egypt, Giza',style: TextStyle(fontSize: 20,color: Colors.black87),),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          color: Colors.white,
                                          width: MediaQuery.of(context).size.width,
                                          margin:const EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                  height: 23,
                                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width *.05,bottom: 10),
                                                  child: const Text('Additional Details',style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)),
                                              Container(
                                                width: MediaQuery.of(context).size.width,
                                                margin:EdgeInsets.only(left: MediaQuery.of(context).size.width *.02) ,
                                                child: Row(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                  children: const[
                                                    Text('Delivery Details',style: TextStyle(fontSize: 20,color: Colors.grey),),
                                                    Text('Home Delivery Available \nCash On Delivery',style: TextStyle(fontSize: 20,color: Colors.black87),),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ) ,
                                );
                              }
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width *.5,
                          height: 3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
