
import 'package:flutter/material.dart';

class ItemTypeContainer extends StatefulWidget {
  String type;
  IconData iconData;
  Function(TapDownDetails ) onTapDown;

   ItemTypeContainer({Key? key,required this.type,required this.iconData,required this.onTapDown,}) : super(key: key);

  @override
  State<ItemTypeContainer> createState() => _ItemTypeContainerState();
}

class _ItemTypeContainerState extends State<ItemTypeContainer> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown:widget.onTapDown,
      child: Container(
        padding:const EdgeInsets.only(right: 3,bottom: 3,top: 3),
        margin:const EdgeInsets.only(top: 10),
        width: MediaQuery.of(context).size.width *.30,
        height: MediaQuery.of(context).size.height *.05,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white,width: 1.5),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(widget.iconData,size: 20,color: Colors.white,),
              Text(
                 widget.type ,
                style:const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 18,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
