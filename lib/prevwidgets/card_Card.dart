import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../api_actions/Cart_provider.dart';
import '../api_actions/api_models.dart';
class CartCard extends StatefulWidget {
  final Products prod;
  const CartCard({Key? key, required this.prod}) : super(key: key);

  @override
  State<CartCard> createState() => _CartCardState();
}

class _CartCardState extends State<CartCard> {

  int count = 1;

  increase() {
    setState(() {
      count++;
    });
  }

  decrease() {
    if (count > 1) {
      setState(() {
        count--;
      });
    }
    return count;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin:
        EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 125,
              margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15)),
                  image: DecorationImage(
                      image: NetworkImage(widget.prod.images!.first),
                      fit: BoxFit.fitHeight)),
            ),
            Container(
              width: MediaQuery.of(context).size.width * .6,
              height: MediaQuery.of(context).size.height * .2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.prod.title!,
                        style: TextStyle(
                            color: Colors.black, fontSize: 22),
                      ),
                      Text(
                        '\$${(widget.prod.price)!*(count)}',
                        style: TextStyle(
                            color:
                            Theme.of(context).primaryColor,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Text(
                    '\$${widget.prod.price}',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 20),
                  ),
                  Container(
                    child: Row(
                      children: [
                        buildContainerPress(
                          context,
                          InkWell(
                            onTap: (){increase();},
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Theme.of(context).primaryColor,
                        ),
                        buildContainerPress(
                            context,
                            Text(
                              '${count}',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .primaryColor,
                                fontSize: 16,
                              ),
                            ),
                            Colors.white),
                        buildContainerPress(
                          context,
                          InkWell(
                            onTap: (){decrease();},
                            child: Icon(
                              Icons.remove,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                          Theme.of(context).primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
    );
  }
  Container buildContainerPress(
      BuildContext context, Widget child, Color colContainer) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.only(right: 12, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colContainer,
        border: Border.all(color: Theme.of(context).primaryColor),
      ),
      child: Center(
        child: child,
      ),
    );
  }
}