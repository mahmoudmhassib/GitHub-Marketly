import 'package:flutter/material.dart';


class MypageViewScreen extends StatefulWidget {
  int pageIndex;
  String title;
   MypageViewScreen({Key? key,required this.pageIndex,required this.title}) : super(key: key,);

  @override
  State<MypageViewScreen> createState() => _MypageViewScreenState();
}

class _MypageViewScreenState extends State<MypageViewScreen> {


  @override
  Widget build(BuildContext context) {
    List<String> img=const[
      'lib/home_image/73044956-farmers-market-vegetable-market-fresh-vegetables.webp',
      'lib/home_image/Brown-eggs.webp',
      'lib/home_image/broccoli-in-a-pile-royalty-free-image-593310638-1564523257.jpg',
    ];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color:Colors.white,
                  ),
                ),
              ],
            ),
            Positioned(
              top: MediaQuery.of(context).size.height *.19,
              bottom: 0,
              left: MediaQuery.of(context).size.width * 0.10,
              right: MediaQuery.of(context).size.width * 0.10,
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * .8,
                  height: MediaQuery.of(context).size.height *.8,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                              height: MediaQuery.of(context).size.height *.46,
                              width: MediaQuery.of(context).size.width * .8 ,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(15),topLeft: Radius.circular(15)),
                                image: DecorationImage(
                                  image: AssetImage(img[widget.pageIndex]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                      Container(
                        margin:const EdgeInsets.only(bottom: 20),
                        width: MediaQuery.of(context).size.width * .8,
                        height: 70,
                        child: Center(
                          child: Text(
                           widget.title ,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 23,
                              fontWeight: FontWeight.normal,
                            ),

                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
