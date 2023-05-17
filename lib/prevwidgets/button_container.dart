import 'package:flutter/material.dart';
class ButtonContainer extends StatelessWidget {
  Widget child;
  Function() funPress;
  EdgeInsets edgeInsets;
  Color colContainer;

   ButtonContainer({Key? key,required this.child,required this.funPress,required this.edgeInsets,required this.colContainer,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:funPress ,
      child: Container(
        margin: edgeInsets,
        width: MediaQuery.of(context).size.width * .85,
        height: 50,
        decoration: BoxDecoration(
          color: colContainer,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white,width: 1.5),
        ),
        child:Center(
          child: child,

        ),
      ),
    );
  }
}
