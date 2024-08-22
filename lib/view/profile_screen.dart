import 'package:ecommerceapp/model/auth_model.dart';
import 'package:ecommerceapp/service/user_service.dart';
import 'package:ecommerceapp/view/admin/admin_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final currentuser = FirebaseAuth.instance.currentUser?.uid ?? "";
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: CircleAvatar(
              maxRadius: 40,
            ),
          ),
          Gap(20),
          FutureBuilder(
              future: UserService().getCurrentUser(currentuser),
              builder: (context, snapshot) {
                AuthModel? user = snapshot.data;
                return Text(user?.username ?? "");
              }),
          ListTile(
            title: Text('about'),
            onTap: () {},
          ),
          ListTile(
            title: Text('my orders'),
            onTap: () {},
          ),
          ListTile(
            title: Text('payments'),
            onTap: () {},
          ),
          ListTile(
            title: Text('admin'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AdminPage(),
              ));
            },
          ),
          ListTile(
            title: Text('logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
