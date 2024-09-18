import 'package:ecommerceapp/service/product_service.dart';
import 'package:ecommerceapp/view/category/electronics.dart';
import 'package:ecommerceapp/view/category/fashion.dart';
import 'package:ecommerceapp/view/category/home_appliances.dart';
import 'package:ecommerceapp/view/category/sportspage.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => SportsPage(),
              ));
            },
            child: Container(
              height: 100,
              color: Colors.amber,
              child: Center(
                child: Text('sports',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ),
          // Container with a fixed height
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ElectronicsPage(),
                  ));
                },
                child: Container(
                  height: 100,
                  width: 200,
                  color: Colors.pink,
                  child: Center(
                    child: Text('Electronics',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
              Gap(11),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => FashionPage(),
                  ));
                },
                child: Container(
                  height: 100,
                  width: 200,
                  color: Colors.red,
                  child: Center(
                    child: Text('fashion',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomeAppliances(),
              ));
            },
            child: Container(
              height: 100,
              color: Colors.blue,
              child: Center(
                child: Text('Home appliances',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
          ),
          // Expanded ListView for product display
          Expanded(
            child: StreamBuilder(
              stream: ProductService().getProducts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error fetching products'),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Text('No products available'),
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
                              data.prodescription ??
                                  'Product description goes here.',
                              style: TextStyle(fontSize: 14),
                            ),
                            SizedBox(height: 8),
                            Text(
                              '${data.proprice ?? ''}',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.green),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
