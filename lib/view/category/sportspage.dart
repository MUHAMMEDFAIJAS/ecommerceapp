import 'package:flutter/material.dart';
import 'package:ecommerceapp/service/product_service.dart';
import 'package:ecommerceapp/model/product_model.dart';

class SportsPage extends StatelessWidget {
  const SportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sports'),
      ),
      body: StreamBuilder<List<ProductModel>>(
        stream: ProductService().getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error fetching sports items'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No sports items available'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final data = snapshot.data![index];

                return Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (data.proimage != null)
                        Image.network(
                          data.proimage!,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      Text(
                        data.prodname ?? 'Product Name',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        data.prodescription ?? 'Product description goes here.',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '${data.proprice ?? ''}',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
