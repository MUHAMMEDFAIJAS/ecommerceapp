import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:ecommerceapp/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SHOPZY'),
      ),
      body: SingleChildScrollView(
        // Makes the whole content scrollable
        child: Column(
          children: [
            // Carousel Slider
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 900),
                viewportFraction: 1,
              ),
              items: [
                'asset/images/homewinter3.jpg',
                'asset/images/image2.jpg',
                'asset/images/homewinter1.jpg',
              ].map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(item),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            const Gap(40),

            StreamBuilder(
                stream: ProductService().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('error');
                  } else {
                    return GridView.builder(
                      shrinkWrap:
                          true, // Makes the GridView take only the necessary space
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable GridView's internal scroll
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // 2 columns
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 0.75,
                      ),
                      itemCount:
                          snapshot.data!.length, // Number of items in the grid
                      itemBuilder: (context, index) {
                        ProductModel data = snapshot.data![index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.orange[100],
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                data.proimage!,
                                fit: BoxFit.cover,
                                height: 150,
                                width: 150,
                              ),
                              const Gap(10),
                              Text(
                                data.prodname.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                              const Gap(5),
                              Text(
                                data.proprice.toString(),
                                style: TextStyle(
                                    fontSize: 14, color: Colors.green),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
