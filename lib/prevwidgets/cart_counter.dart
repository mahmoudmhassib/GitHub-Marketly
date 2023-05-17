import 'package:flutter/material.dart';
class CartCounter extends StatelessWidget {
  var count;
   CartCounter({Key? key,required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 25,
      height: 25,
      decoration: BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text('${count}',style: TextStyle(color: Colors.white,fontSize: 18),),
      ),
    );
  }
}
