import 'package:flutter/material.dart';

import '../prevwidgets/button_container.dart';
import '../prevwidgets/text_field.dart';
import '../prevwidgets/welcome_title_login.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child:Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            WelcomeTitleLogin(
              edgeInsets:const EdgeInsets.only(top: 50,bottom: 10),
              subtitle: 'Signup to your account',
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 350,
              margin:const EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextFieldLogin(hint: 'First Name', obscure: false,fontsize: 20,),
                  TextFieldLogin(hint: 'Last Name', obscure: false,fontsize: 20,),
                  TextFieldLogin(hint: 'Email ID/Phone Number', obscure: false,fontsize: 20,),
                  TextFieldLogin(hint: 'Password', obscure: true,fontsize: 20,),
                  TextFieldLogin(hint: 'Re-enter Password', obscure: true,fontsize: 20,),
                ],
              ),
            ),
            ButtonContainer(
              child:   Text(
                'Create',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 25,
                ),
              ),

              funPress: () {  },
              edgeInsets:const EdgeInsets.only(bottom: 10),
              colContainer: Colors.white,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
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
        ) ,
      ),
    );
  }
}
