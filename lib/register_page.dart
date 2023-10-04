// lib/screens/login_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/textfield.dart';


import 'button.dart';
import 'login_page.dart';

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

class RegisterPage extends StatefulWidget {
  RegisterPage();

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmdController = TextEditingController();

  void signUp() async {
    showDialog(
      context: context,
      builder: (ctx) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop the loading circle
      Navigator.pop(context);
      //Wrong Email
      showErrorMessage(e.code);
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

  void buttonTapped(BuildContext ctx) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => LoginPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: gradientTry,
        ),
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
                      ),
                      obsecureText: false,
                      hintText: 'Email',
                    ),
                    MyTextField(
                      icon: const Icon(
                        Icons.lock,
                      ),
                      obsecureText: false,
                      hintText: 'Password',
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    MyTextField(
                      icon: const Icon(
                        Icons.flashlight_on,
                      ),
                      obsecureText: false,
                      hintText: 'Confirm Password',
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    MyButton(
                      text: 'Sign Up',
                      onTap: signUp,
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Alreadyt have an account?',
                          style: TextStyle(color: Colors.grey),
                        ),
                       const SizedBox(
                          width: 6,
                        ),
                        GestureDetector(
                          onTap: () => buttonTapped(context),
                          child: const Text(
                            'LOG IN',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      ],
                    )
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
