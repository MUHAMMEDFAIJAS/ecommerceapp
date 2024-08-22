import 'package:ecommerceapp/view/admin/product_add.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  const AdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'adminn page',
            style: TextStyle(fontSize: 20),
          ),
          ListTile(
            title: Text('add product'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductAddScreen(),
              ));
            },
          )
        ],
      ),
    );
  }
}
