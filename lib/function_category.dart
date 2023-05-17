import 'package:flutter/material.dart';


void showItemMenu(context,Rect rect1, Rect rect2)async{

  final RenderObject? overlay=Overlay.of(context).context.findRenderObject();
  final result=await showMenu(
    context: context,
    position: RelativeRect.fromRect(
      rect1,rect2,

    ),
    items:const [
      PopupMenuItem(
        child: Text('Beverage'),
        value: 'bev',
      ),
      PopupMenuItem(
        child: Text('Bread & Bakery'),
        value: 'BreadBakery',
      ),
      PopupMenuItem(
        child: Text('Vegetable'),
        value: 'Vegetable',
      ),
      PopupMenuItem(
        child: Text('Fruit'),
        value: 'Fruit',
      ),
      PopupMenuItem(
        child: Text('Egg'),
        value: 'Egg',
      ),
      PopupMenuItem(
        child: Text('Frozen Veg'),
        value: 'FrozenVeg',
      ),
      PopupMenuItem(
        child: Text('Home Care'),
        value: 'HomeCare',
      ), PopupMenuItem(
        child: Text('Pet Care'),
        value: 'PetCare',
      ),PopupMenuItem(
        child: Text('WishList'),
        value: 'WishList',
      ),
    ],
  );
  switch(result){
    case 'bev':
      Navigator.of(context).pushNamed('/beverage');
      break;
    case 'BreadBakery':
      Navigator.of(context).pushNamed('/breadbakery');
      break;
    case 'Vegetable' :
      Navigator.of(context).pushNamed('/vegetable');
      break;
    case 'Fruit' :
      Navigator.of(context).pushNamed('/fruit');
      break;
      case 'Egg' :
        Navigator.of(context).pushNamed('/egg');
    break;
   case 'FrozenVeg' :
     Navigator.of(context).pushNamed('/frozenveg');
    break;
    case 'HomeCare' :
      Navigator.of(context).pushNamed('/homecare');
    break;
    case 'PetCare' :
      Navigator.of(context).pushNamed('/petcare');
    break;case 'WishList' :
    Navigator.of(context).pushNamed('/wishlist');
    break;
  }
}


/*
Offset tapPosition=Offset.zero;
void getTapPosition(context,TapDownDetails tapPosition,Function() fun)  {
  final RenderBox renderBox=context.findRenderObject() as RenderBox;

      tapPosition=  renderBox.globalToLocal(tapPosition.globalPosition) as TapDownDetails;
  print(tapPosition);
}*/
