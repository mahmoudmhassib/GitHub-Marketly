import 'package:flutter/material.dart';

import '../function_category.dart';
import 'itemtypecontainer.dart';
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget child;
  final double height;

  CustomAppBar({
    required this.child,
    this.height = kToolbarHeight,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: MediaQuery.of(context).size.height *.07,
      backgroundColor: Theme.of(context).primaryColor,
      leading: IconButton(
          onPressed: (){
            print('777777777777');

            Navigator.of(context).popUntil((route) => route.isFirst);
      },
          icon:const Icon(Icons.arrow_back)),
      title: widget.child,
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
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *.1),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height *.09,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
               ItemTypeContainer(type:'Sort by', iconData: Icons.menu,onTapDown: (position){},),
              ItemTypeContainer(type:'Location',iconData:Icons.location_on,onTapDown: (position){},),
              ItemTypeContainer(
                type:'Category',
                iconData:Icons.category,
                onTapDown: (position){
                  showItemMenu(
                    context,
                    Rect.fromLTRB(MediaQuery.of(context).size.width *.9, MediaQuery.of(context).size.height * .16, MediaQuery.of(context).size.width *.1, 10),
                    Rect.fromLTWH(0, 0, 40, 70),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
