import 'package:ecommerceapp/service/auth_service.dart';
import 'package:ecommerceapp/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 300,
              width: 390,
              color: Colors.orange[200],
              child: Column(children: [
                Gap(10),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    hintText: 'name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Gap(10),
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
                      AuthService().signupAuth(
                          emailController.text,
                          passwordController.text,
                          usernameController.text,
                          context);
                    },
                    child: const Text('signup')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('already have an account'),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ));
                        },
                        child: const Text('login'))
                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
