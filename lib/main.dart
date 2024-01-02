// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_ui/firebase_options.dart';
import 'package:flutter_ui/homepage.dart';
import 'package:flutter_ui/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_page.dart';
import 'login_page.dart';
import 'splash.dart';
import 'package:firebase_core/firebase_core.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}


class _MyAppState extends State<MyApp> {





  bool isFirstTimeUser = true;

  @override
  void initState() {
    super.initState();
    checkFirstTimeUser();

  
  }

  Future<void> checkFirstTimeUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isFirstTimeUser = prefs.getBool('isFirstTimeUser') ?? true;
  
    });
  }

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home:
      isFirstTimeUser? 
    SplashScreen(): const AuthPage()
    );
  }
}
