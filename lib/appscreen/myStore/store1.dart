import 'package:flutter/material.dart';
import 'package:marketly/appscreen/myStore/store2.dart';

import '../../prevwidgets/button_container.dart';

class Store1 extends StatefulWidget {
  const Store1({super.key});

  @override
  State<Store1> createState() => _Store1State();
}

class _Store1State extends State<Store1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height *.13,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'MyStore',
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width *.65,
            height: 200,
            margin:const EdgeInsets.only(top: 30,bottom: 35),
            decoration: BoxDecoration(
              image:const DecorationImage(image: AssetImage('lib/home_image/Brown-eggs.webp'),fit: BoxFit.cover),
            ),
          ),
          Center(
            child:const Text(
              'You Don\'t Have a Store',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: ButtonContainer(
              child:   Text(
                'Create Store',
                style: TextStyle(
                  color:Colors.white,
                  fontSize: 25,
                ),
              ),
              funPress: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Store2()));
                print('333333');
              },
              colContainer: Theme.of(context).primaryColor,
              edgeInsets:const EdgeInsets.only(top: 40),),
          ),
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}
