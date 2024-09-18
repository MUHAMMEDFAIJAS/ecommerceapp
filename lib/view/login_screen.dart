import 'package:ecommerceapp/service/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 390,
              color: Colors.orange[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  Gap(10),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        AuthService().loginAuth(emailController.text,
                            passwordController.text, context);
                      },
                      child: const Text('log in'))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
