// lib/screens/login_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'button.dart';
import 'register_page.dart';
import 'textfield.dart';

Gradient gradientTry = const LinearGradient(
  colors: [
    Color(
      0xff623663,
    ),
    Color(
      0xffb33d7e,
    ),
  ],
  // begin: Alignment.topCenter,
  // end: Alignment.bottomRight,
);

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late final SharedPreferences sharedPreferences;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmdController = TextEditingController();



void saveInput() async{
sharedPreferences = await SharedPreferences.getInstance();
}


void signIn() async{
User? currentUser;
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .then((auth) {
        currentUser = auth.user;
      }).catchError((error) {
        showErrorMessage(error);
      });
      if (currentUser != null) {
        if (!mounted) return;
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ));

  
      }
    } catch (e) {
      if (e is FirebaseAuthException) {


        print("Firebase Authentication Error: ${e.message}");
      } else {
        print("Error: $e");
        showErrorMessage("Incorrect Email or Password");
    
      }
    }

}


  void showErrorMessage(String message) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            backgroundColor: Colors.purple,
            title: Center(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        });
  }

  void buttonTapped(BuildContext contex) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => RegisterPage(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb33d7e),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(gradient: gradientTry),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    MyTextField(
                      icon: const Icon(
                        Icons.email,
                        color: Color(0xfff9f6f8),
                      ),
                      obsecureText: false,
                      hintText: 'Email',
                      controller: emailController,
                    ),
                    MyTextField(
                      icon: const Icon(
                        Icons.lock,
                        color: Color(0xfff9f6f8),
                      ),
                      obsecureText: true,
                      hintText: 'Password',
                      controller: passwordController,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forgot Password',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    MyButton(
                      text: 'Sign In',
                      onTap: signIn,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Dont\t have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () => buttonTapped(context),
                          child: const Text(
                            'SIGN UP',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
