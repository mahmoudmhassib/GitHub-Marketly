import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_actions/provider_method.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
    var _selectedIndexs = [];
  @override
  Widget build(BuildContext context) {
    List<String> textButton = const[
      'Delivered',
      'Order Placed',
      'Payment Confirmed',
      'Processed'
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height *.13,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Order History',
          style: TextStyle(fontSize: 25),
        ),
        actions:const [
          Icon(
            Icons.favorite,
          ),
          SizedBox(
            width: 15,
          ),
          Icon(
            Icons.card_travel,
          ),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            margin:const EdgeInsets.only(left: 15, top: 30, bottom: 15),
            width: double.infinity,
            height: 60,
            child: Row(
              children: [
                const Text(
                  'Transaction',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Container(
                  width: 110,
                  height: 30,
                  margin:const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        spreadRadius: 7,
                        offset: Offset(.5, 2),
                        color: Colors.grey.withOpacity(.25),
                      ),
                    ]
                  ),
                  child: Center(
                    child: Text(
                      'Janauri 2020',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Consumer<ProviderProduct>(
            builder: (ctx,value,child){
              final prov=value.products;
              if(prov.isNotEmpty){
                return  Expanded(
                  child: ListView.builder(
                    itemCount: textButton.length,
                    itemBuilder: (ctx, index) {
                      return Container(
                        margin:const EdgeInsets.only(bottom: 11,right: 8,left: 8),
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            boxShadow: [
                              const BoxShadow(
                                  blurRadius: 1,
                                  color: Colors.grey,
                                  spreadRadius: 2,
                                  offset: Offset(0, 4)),
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin:const EdgeInsets.only(left: 8,),
                              width: MediaQuery.of(context).size.width *.2,
                              height: MediaQuery.of(context).size.height *.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                image: DecorationImage(image: NetworkImage(prov[index].images![0]),fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width *.72,
                              height: MediaQuery.of(context).size.height *.2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                        text: '${prov[index].title}\n',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      TextSpan(
                                        text: '\$${prov[index].price}\n',
                                        style: TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                    ]),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if ( _selectedIndexs.contains(index)) {
                                          _selectedIndexs.remove(index);
                                        } else {
                                          _selectedIndexs.add(index);
                                          final js = _selectedIndexs.where((e) => e==index).toList();
                                          _selectedIndexs= js;
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: 150,
                                      height: 30,
                                      margin:const EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: Theme.of(context).primaryColor,
                                            width: 1.5),
                                        color:  _selectedIndexs.contains(index)
                                            ? Theme.of(context).primaryColor
                                            : Colors.white,
                                      ),
                                      child: Center(
                                        child: Text(
                                          textButton[index],
                                          style: TextStyle(
                                            color: _selectedIndexs.contains(index)
                                                ? Colors.white
                                                : Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }else{
                return const SizedBox(height:50,width:50,child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
