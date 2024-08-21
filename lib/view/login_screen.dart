import 'package:ecommerceapp/service/auth_service.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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
                AuthService().loginAuth(
                    emailController.text, passwordController.text, context);
              },
              child: const Text('log in'))
        ],
      ),
    );
  }
}
