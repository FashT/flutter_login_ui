// lib/screens/splash_screen.dart
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_ui/homepage.dart';

import 'login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


Gradient gradientTry = const LinearGradient(
  colors: [
    Color(
      0xff623663,
    ),
    Color(
      0xffb33d7e,
    ),
  ],
  begin: Alignment.topRight,
  end: Alignment.bottomCenter,
);

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {



  bool isFirstTimeUser = true;

 

  Future<void> checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
    });
  }


  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 5),
      () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => isFirstTimeUser? const HomePage():LoginPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: gradientTry,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration:
                 const  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              child:const Center(
                child:  Text(
                  'S',
                  style: TextStyle(
                    fontSize: 100,
                    color: Color(0xffb33d7e),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



//}
      