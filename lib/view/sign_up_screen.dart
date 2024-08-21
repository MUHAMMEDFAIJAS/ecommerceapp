import 'package:ecommerceapp/service/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              hintText: 'name',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'email',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              hintText: 'password',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
          TextButton(
              onPressed: () {
                AuthService().signupAuth(emailController.text,
                    passwordController.text, usernameController.text, context);
              },
              child: const Text('signup'))
        ],
      ),
    );
  }
}
