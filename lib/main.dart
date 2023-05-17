import 'package:flutter/material.dart';
import 'package:marketly/api_actions/Cart_provider.dart';
import 'package:marketly/appscreen/browse_screen/beverages.dart';
import 'package:marketly/appscreen/browse_screen/bread_bakery.dart';
import 'package:marketly/appscreen/browse_screen/egg.dart';
import 'package:marketly/appscreen/browse_screen/frozen_veg.dart';
import 'package:marketly/appscreen/browse_screen/fruits.dart';
import 'package:marketly/appscreen/browse_screen/pet_care.dart';
import 'package:marketly/appscreen/browse_screen/vegetable.dart';
import 'package:marketly/appscreen/browse_screen/wish_list.dart';
import 'package:marketly/splash_screen.dart';
import 'package:provider/provider.dart';
import 'api_actions/provider_method.dart';
import 'appscreen/browse_screen/home_care.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
      ChangeNotifierProvider(create: (context) => ProviderProduct(),),
      ChangeNotifierProvider(create: (context) => CartProvider(),)
    ],
    child: MyApp(),
    ),

  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/':(context)=>SplashScreen(),
        '/beverage':(context)=>Beverages(),
        '/breadbakery':(context)=>BreadBakery(),
        '/vegetable':(context)=>Vegetable(),
        '/fruit':(context)=>Fruit(),
        '/egg':(context)=>Egg(),
        '/frozenveg':(context)=>FrozenVeg(),
        '/homecare':(context)=>HomeCare(),
        '/petcare':(context)=>PetCare(),
        '/wishlist':(context)=>WishList(),
      },
     // home: SplashScreen(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF33907C),
      ),

    );
  }
}
