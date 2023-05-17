import 'package:flutter/material.dart';


class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  var _selectedIndexs = [];

  @override
  Widget build(BuildContext context) {
    List<String> textButton =const [
      'Edit Profile',
      'Language & Currency',
      'Feedback',
      'Refer a Friend',
      'Terms & Conditions',
      'Logout',
    ];
    List<IconData> icon=const[
      Icons.edit,
      Icons.language,
      Icons.diversity_1,
      Icons.rate_review_outlined,
      Icons.person_search_outlined,
      Icons.logout,
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text(
          'Profile',
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
          preferredSize:
              Size.fromHeight(MediaQuery.of(context).size.height) ,
          child: Container(
            height: MediaQuery.of(context).size.height *.8,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.white
                ],
                stops: [0.5,0.5],
              )
            ),
            child: Column(

              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                        left: 15, bottom: MediaQuery.of(context).size.height * .05,top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              't'.toUpperCase(),
                              style:const TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          margin:const EdgeInsets.only(left: 15),
                          height: 70,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const[
                                Text(
                                'Tradly Team',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '01118697331',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '7eso@gmail.com',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  clipBehavior: Clip.none,
                  height: MediaQuery.of(context).size.height *.48,
                  padding:const EdgeInsets.only(left: 10,right: 10),
                  width: MediaQuery.of(context).size.width * .8,
                  decoration: BoxDecoration(
                    boxShadow: const[
                      BoxShadow(
                          offset: Offset(1, 5),
                          color: Colors.grey,
                          blurRadius: 7,
                          spreadRadius: 2),
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    padding:const EdgeInsets.only(right: 10,left: 5),
                    itemCount: textButton.length ,
                      itemBuilder: (ctx,index){

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              print("outside");
                              print(index);

                              if ( _selectedIndexs.contains(index)) {
                                print("inside true");
                                print(index);
                                _selectedIndexs.clear();
                              }
                              else {
                                print("inside false");
                                print(index);
                                _selectedIndexs.clear();
                                _selectedIndexs.add(index);

                              }
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textButton[index],
                                  style: TextStyle(
                                      fontSize:17,
                                    color:  _selectedIndexs.contains(index)
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                  ),
                                ),
                                Icon(icon[index],

                                  color:  _selectedIndexs.contains(index)
                                    ? Theme.of(context).primaryColor
                                    : Colors.grey,),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: Colors.grey,
                        ),
                      ],
                    );
                  })
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
}
