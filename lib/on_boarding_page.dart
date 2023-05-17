import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:marketly/prevwidgets/button_container.dart';
import 'package:marketly/prevwidgets/my_pageveiw_screen.dart';
import 'package:marketly/tab_screen.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
 final PageController _controller = PageController();
 @override
 void dispose() {
   _controller.dispose();
   super.dispose();
 }
 List<Widget> _pages=[
   MypageViewScreen(pageIndex: 0,title:'Empowering Artisans,\nFarmers & Micro Business', ),
   MypageViewScreen(pageIndex: 1,title:'Connectting NGOs,Social\nEnterprises with Communities',),
   MypageViewScreen(pageIndex: 2,title:'Donate, Invest & Support\n Infrastructure project',),
 ];
 int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controller,
                scrollDirection: Axis.horizontal,
                children: _pages,
                onPageChanged: (index){
                  setState(() {
                    selectedIndex=index;
                  });
                },
              ),
            ),
            Center(
              child: Container(
                margin:const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: selectedIndex==0?Theme.of(context).primaryColor:Colors.black38,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      margin:const EdgeInsets.only(right: 15,left: 15),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: selectedIndex==1?Theme.of(context).primaryColor:Colors.black38,
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color:selectedIndex==2?Theme.of(context).primaryColor:Colors.black38,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ButtonContainer(
                child: selectedIndex==2?Text('Finish',style: TextStyle(color: Colors.white,fontSize: 25),):Text('Next',style: TextStyle(color: Colors.white,fontSize: 25),),
                funPress: () {
                  print(selectedIndex);
                  if(selectedIndex==2){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>TabScreen()));
                  }else{
                    _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.linear);
                  }
                },
                edgeInsets:const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                colContainer: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
