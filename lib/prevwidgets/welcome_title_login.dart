import 'package:flutter/material.dart';
class WelcomeTitleLogin extends StatelessWidget {
  String subtitle;
  EdgeInsets edgeInsets;
   WelcomeTitleLogin({Key? key,required this.subtitle,required this.edgeInsets}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin:edgeInsets,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Welcome to tradly',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
          Text(
            subtitle,
            style:const TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.normal,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
