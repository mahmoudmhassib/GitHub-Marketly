import 'package:flutter/material.dart';
class TextFieldLogin extends StatelessWidget {
  String hint;
  bool obscure;
  double fontsize;
   TextFieldLogin({Key? key,required this.hint,required this.obscure,required this.fontsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .85,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white,width: 1.5),
      ),
      child: TextField(
        style:const TextStyle(
            color: Colors.white,
            fontSize: 25
        ),
        cursorColor: Colors.white,
        cursorHeight: 26,
        cursorWidth: 2,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white70,
            fontSize: fontsize,
            fontWeight: FontWeight.normal,
          ),
          contentPadding: EdgeInsets.only(left: MediaQuery.of(context).size.width *.05,bottom: MediaQuery.of(context).size.width *.02 ),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
