import 'package:bottom_bar_page_transition/bottom_bar_page_transition.dart';
import 'package:flutter/material.dart';

import 'appscreen/browse_screen/browse_home.dart';
import 'appscreen/home.dart';
import 'appscreen/order_history.dart';
import 'appscreen/profile.dart';
import 'appscreen/myStore/store1.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key});

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _currentPage = 0;
  static const int totalPage = 5;
  static const List<String> pagesName =const [
    'Home',
    'Browse',
    'Store',
    'Order History',
    'profile',
  ];
  List<dynamic> _pages =const [
    HomeScreen(),
    Browse(),
    Store1(),
    OrderHistory(),
    Profile(),
  ];
  List<IconData> _icons =const [
    Icons.home,
    Icons.search,
    Icons.house,
    Icons.multiline_chart,
    Icons.person,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentPage],
      bottomNavigationBar: BottomBarPageTransition(
        currentIndex: _currentPage,
        totalLength: totalPage,
        builder: (ctx, index) {
          return BottomNavigationBar(
              currentIndex: _currentPage,
              onTap: (index) {
                _currentPage = index;
                setState(() {});
              },
              selectedItemColor: Theme.of(context).primaryColor,
              unselectedItemColor: Colors.grey,
              type: BottomNavigationBarType.fixed,
              items: List.generate(
                  totalPage,
                  (index) => BottomNavigationBarItem(
                        icon: Icon(
                          _icons[index],
                          size: 32,
                        ),
                        label: pagesName[index],
                      )));
        },
      ),
    );
  }
}
