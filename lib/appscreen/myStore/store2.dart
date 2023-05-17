import 'package:flutter/material.dart';
class Store2 extends StatelessWidget {
  const Store2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text(
          'MyStore',
          style: TextStyle(fontSize: 25),
        ),
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
        toolbarHeight: 100,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
              child: Container(
                width: MediaQuery.of(context).size.width ,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            margin:const EdgeInsets.only(bottom: 15,top: 15),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: Center(
                              child: Text(
                                't'.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'Tradly Store',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 130,
                            height: 26,
                            margin:const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              border: Border.all(color: Theme.of(context).primaryColor,width: 1.5),
                            ),
                            child: Center(
                              child: Text(
                                'Edit Store',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,

                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 26,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Theme.of(context).primaryColor,
                              border: Border.all(color: Theme.of(context).primaryColor),
                            ),
                            child:const Center(
                              child: Text(
                                'View Store',
                                style: TextStyle(
                                  color: Colors.white,

                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children:const [
                          Divider(
                            color: Colors.grey,
                            thickness: .5,

                          ),
                          Text(
                            'Remove Store',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: MediaQuery.of(context).size.width ,
              color: Colors.black12,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'You don\'t have a product',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width *.7,
                    height: 50,

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white10,
                      border: Border.all(color: Theme.of(context).primaryColor,width: 1.5),
                    ),
                    child: Center(
                      child: Text(
                        'Add product',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 20
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
