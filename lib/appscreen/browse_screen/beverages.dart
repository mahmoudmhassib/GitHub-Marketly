
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../api_actions/provider_method.dart';
import '../../prevwidgets/appbar_browse_items.dart';
import '../../prevwidgets/grid_view_browse.dart';

class Beverages extends StatelessWidget {
  const Beverages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        height: MediaQuery.of(context).size.height *.15,
        child:const Text('Beverage') ,
      ),
      body:GridView.builder(
        padding:const EdgeInsets.only(left: 20,top: 20,right: 15,bottom: 20),
        itemCount: 4,
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 5,
          childAspectRatio: 3/2,
          mainAxisExtent: 215,
        ),
      itemBuilder: (ctx,index){
        return Consumer<ProviderProduct>(
            builder: (ctx,value,child) {
              final prov=value.products;
              if(prov.isNotEmpty) {
                return GridViewBrowse(product: prov[index],);
              }else{
                return const SizedBox(height:50,width:50,child: CircularProgressIndicator());
              }
            }
        );
      },
      ),
    );
  }
}
