import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';

import 'appscreen/login_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image(
          image:const AssetImage(
              'lib/home_image/Splash.png',
          ),
      ),
      backgroundColor: Theme.of(context).primaryColor,
        showLoader:false,
      logoWidth: 200,
        navigator:LoginScreen(),
      durationInSeconds: 8,
    );
  }
}
