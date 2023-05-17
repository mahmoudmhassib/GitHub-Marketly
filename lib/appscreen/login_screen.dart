import 'package:flutter/material.dart';
import 'package:marketly/appscreen/signup_screen.dart';

import '../on_boarding_page.dart';
import '../prevwidgets/button_container.dart';
import '../prevwidgets/text_field.dart';
import '../prevwidgets/welcome_title_login.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WelcomeTitleLogin(
                  edgeInsets:const EdgeInsets.only(top: 100,bottom: 20),
                  subtitle: 'Login to your account',
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 120,
                  margin:const EdgeInsets.only(top: 25,bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldLogin(hint:'Email/Mobile Number', obscure: false,fontsize: 20,),
                      TextFieldLogin(hint:'Password', obscure: true,fontsize: 20,),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:250,
                  margin:const EdgeInsets.only(top: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ButtonContainer(
                        child:   Text(
                          'Login',
                          style: TextStyle(
                            color:Theme.of(context).primaryColor,
                            fontSize: 25,
                          ),
                        ),
                          funPress:(){
                            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>OnBoardingPage()));
                            print('1111111111');
                          },
                        edgeInsets:const EdgeInsets.only(bottom: 40),
                        colContainer: Colors.white,
                      ),
                      const Text(
                        'Forget your password?',
                        style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const  Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.normal,
                                fontSize: 20,
                              ),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>SignUpScreen()));
                                print('222222222');
                              },
                              child:const Text(
                                'Sign up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}