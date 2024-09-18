
import 'package:ecommerceapp/view/bottom_bar.dart';
import 'package:ecommerceapp/view/login_screen.dart';
import 'package:ecommerceapp/view/sign_up_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // Check if there's data (user is logged in)
          if (snapshot.hasData) {
            return const BottomBar();  // User is logged in, navigate to the main app
          } else {
            return const SignUpScreen();  // User is not logged in, navigate to login page
          }
        },
      ),
    );
  }
}
