import 'package:flutter/material.dart';
import 'package:marketly/api_actions/provider_method.dart';
import 'package:provider/provider.dart';

import '../prevwidgets/newproduct.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) {
      Provider.of<ProviderProduct>(context,listen: false).fetchAllProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height *.07,
        backgroundColor: Theme.of(context).primaryColor,
        title:const Text(
          'Groceries',
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *.09),
          child: Container(
            width: MediaQuery.of(context).size.width *.8,
            height: MediaQuery.of(context).size.height *.05,
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height *.03),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Product',
                contentPadding:const EdgeInsets.symmetric(vertical: 10),
                prefixIcon: Icon(
                  Icons.search,
                  color: Theme.of(context).primaryColor,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                padding:
                const EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 15),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (ctx, index) {
                  return Stack(
                    children: [
                      Container(
                        width: 300,
                        margin:const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image:const AssetImage(
                                'lib/home_image/73044956-farmers-market-vegetable-market-fresh-vegetables.webp'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: .70,
                        child: Container(
                          height: 200,
                          width: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        bottom: 0,
                        left: 20,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ready to deliver to\nyour home'.toUpperCase(),
                              style:const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  wordSpacing: 2,
                                  letterSpacing: 1),
                            ),
                            Container(
                              margin:const EdgeInsets.only(top: 20),
                              width: 200,
                              height: 35,
                              child: Center(
                                child: Text(
                                  'start shopping'.toUpperCase(),
                                  style:const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Consumer<ProviderProduct>(
              builder: (ctx,value,child){
                final prov=value.products;
                if(prov.isNotEmpty){
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    child: GridView.builder(
                      padding:const EdgeInsets.only(bottom: 15,left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: prov.length,
                      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisExtent: 103,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 1,
                        crossAxisSpacing: 1,
                      ),
                      itemBuilder: (ctx, index) {
                        return Stack(
                          children: [
                            Container(
                              width: 105,
                              height: 99,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(prov[index].images![0]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Opacity(
                              opacity: .50,
                              child: Container(
                                height: 99,
                                width: 105,
                                color: Colors.black,
                              ),
                            ),
                            Center(
                              child: Text(
                                prov[index].menuType!,
                                style:const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }else{
                  return const SizedBox(height:20,width:20,child: CircularProgressIndicator(strokeWidth: 3,));
                }
              },
            ),
              NewProduct(title:'New Product',productType:'',productPrice:'\$50', productImage: '',),
            NewProduct(title:'Popular Product',productType:'',productPrice:'\$25', productImage: '',),
            Stack(
              children: [
                Container(
                  margin:const EdgeInsets.only(top: 13,bottom: 120),
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: Theme.of(context).primaryColor,
                  child:Container(
                    margin:const EdgeInsets.only(left: 15,right: 15,top: 15,),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const   Text(
                          'Store to follow',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 90,
                          height: 23,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color:Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              'Veiw All',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor ,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 70,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 260,
                    child: ListView.builder(
                      padding:const EdgeInsets.only(right: 15,left: 15),
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (ctx,index){
                        return Consumer<ProviderProduct>(
                          builder: (ctx,value,child){
                            final prov=value.products;
                            if(prov.isNotEmpty){
                              return  Card(
                                margin:const EdgeInsets.only(right: 10,bottom: 10),
                                elevation: 15,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: 180,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight: Radius.circular(20)),
                                            image: DecorationImage(
                                              image: NetworkImage(prov[index].images![0]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 0,
                                          right: 0,
                                          top: 80,
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context).primaryColor,
                                              border: Border.all(color: Colors.white,width: 2),
                                            ),
                                            child: Center(
                                              child: Text(
                                                't'.toUpperCase(),
                                                style:const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 50,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      height: 70,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          const   Text(
                                            'Tradly Store',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 20,
                                            ),
                                          ),
                                          Container(
                                            width: 120,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(50),
                                              color: Theme.of(context).primaryColor,
                                            ),
                                            child:const Center(
                                              child: Text(
                                                'Follow',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.white  ,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }else{
                              return const SizedBox(height:20,width:20,child: Center(child: CircularProgressIndicator()));
                            }

                          },

                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
