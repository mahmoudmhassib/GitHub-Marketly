import 'package:flutter/material.dart';
import 'package:marketly/api_actions/Cart_provider.dart';
import 'package:provider/provider.dart';

import '../prevwidgets/card_Card.dart';
import '../prevwidgets/cart_counter.dart';

class MyCart extends StatefulWidget {
  MyCart({Key? key}) : super(key: key);

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height * .13,
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text(
            'MyCart',
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            SizedBox(
              width: 30,
              height: 60,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    child: Icon(
                      Icons.shopping_cart,
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 3,
                    child: Consumer<CartProvider>(
                      builder: (context, value, child) {
                        return CartCounter(
                            count: value.cartProduct.length.toString());
                      },
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children: [
            Consumer<CartProvider>(
              builder: (ctx, value, child) {
                final prov = value.cartProduct;
                return Expanded(
                  child: ListView.builder(
                    itemCount: prov.length,
                    itemBuilder: (ctx, index) {
                      if (prov.isEmpty) {
                        return Center(
                          child: Text('no products in cart'),
                        );
                      }
                      final prod = prov[index];
                      return Dismissible(
                        key: Key('${prod}'),
                        onDismissed: (DismissDirection direction) {
                          if (direction == DismissDirection.endToStart) {
                            print('9999');
                          } else {
                            print('88888');
                          }
                          setState(() {
                            Provider.of<CartProvider>(context, listen: false)
                                .deleteProduct(prod);
                          });
                        },
                        confirmDismiss: (DismissDirection direction)  {
                          return  showDialog(
                              context: context,
                              builder: (ctx) {
                                return AlertDialog(
                                  title: const Text('Delete Confiremation'),
                                  content: const Text(
                                      'Are you sure you want to delete this item?'),
                                  actions: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop(true);
                                      },
                                      child: Container(
                                          width: 80,
                                          height: 30,
                                          color: Colors.red,
                                          child: Center(
                                              child: const Text(
                                            'Delete',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: Container(
                                          width: 80,
                                          height: 30,
                                          color: Colors.blue,
                                          child: Center(
                                              child: const Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))),
                                    ),
                                  ],
                                );
                              });
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(
                            Icons.delete,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        child: CartCard(
                          prod: prod,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ));
  }
}
