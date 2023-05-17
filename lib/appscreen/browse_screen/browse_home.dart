import 'package:flutter/material.dart';
import 'package:marketly/api_actions/api_models.dart';
import 'package:provider/provider.dart';
import '../../api_actions/provider_method.dart';
import '../../function_category.dart';
import '../../prevwidgets/grid_view_browse.dart';
import '../../prevwidgets/itemtypecontainer.dart';
class Browse extends StatefulWidget {
  const Browse({super.key});

  @override
  State<Browse> createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  TextEditingController _controller=TextEditingController();
  late List<Products> allProducts;
  String _query = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height *.07,
        backgroundColor: Theme.of(context).primaryColor,
        title:const Text(
          'Browse',
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
         preferredSize: Size.fromHeight(MediaQuery.of(context).size.height *.16),
           child: Container(
             width: MediaQuery.of(context).size.width,
             height: 120,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width *.94,
                   height: MediaQuery.of(context).size.height *.06,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(50),
                   ),
                   child: TextField(
                     controller: _controller,
                     onChanged: (value){
                       setState(() {
                         _query=value ;
                       });

                     },
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
                 Container(
                   width: MediaQuery.of(context).size.width,
                   margin:const EdgeInsets.only(bottom: 5),
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
                             Rect.fromLTRB(MediaQuery.of(context).size.width *.9, MediaQuery.of(context).size.height * .27, MediaQuery.of(context).size.width *.1, 10),
                             Rect.fromLTWH(0, 0, 40, 70),
                           );
                         },
                       ),
                     ],
                   ),
                 ),
               ],
             ),
           ),
       ),
      ),
      body: Consumer<ProviderProduct>(
        builder: (ctx,value,child){
          allProducts=value.products;
          final filteredProducts = filterdProducts();
          if(filteredProducts.isNotEmpty) {
            return GridView.builder(
              padding:const EdgeInsets.only(
                  left: 20, top: 20, right: 15, bottom: 20),
              itemCount: filteredProducts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 5,
                childAspectRatio: 3 / 2,
                mainAxisExtent: 215,
              ),
              itemBuilder: (ctx, index) {
                return GridViewBrowse(product: filteredProducts[index],);
              },
            );
          }else{
            return const SizedBox(height:50,width:50,child: CircularProgressIndicator());
          }
        },

      ),
    );
  }

  List<Products> filterdProducts(){
    if(_query.isEmpty){
      return allProducts;
    } else {
      final filteredProducts = allProducts.where((e) {
        final prodTitle = e.title!.toLowerCase();
        final input = _query.toLowerCase();
        return prodTitle.contains(input);
      }).toList();
return filteredProducts;
    }
  }
}
