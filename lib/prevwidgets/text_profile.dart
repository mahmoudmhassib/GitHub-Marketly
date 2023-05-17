import 'package:flutter/material.dart';
class TextProfile extends StatelessWidget {
  String text;
  Color col;
  Function()? oncolorChange;
  int textIndex;
   TextProfile({Key? key,required this.text,required this.col,required this.oncolorChange,required this.textIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        print("object");
      },
      child:  Text(
        text,
        style: TextStyle(
          color: col,
          fontSize: 18,
        ),
      ),
    );
  }
}
