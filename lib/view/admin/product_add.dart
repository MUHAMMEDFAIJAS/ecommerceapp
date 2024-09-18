import 'dart:io';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:ecommerceapp/service/product_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProductAddScreen extends StatefulWidget {
  const ProductAddScreen({super.key});

  @override
  State<ProductAddScreen> createState() => _ProductAddScreenState();
}

class _ProductAddScreenState extends State<ProductAddScreen> {
  TextEditingController productnameController = TextEditingController();
  TextEditingController productdescriptionController = TextEditingController();
  TextEditingController productpriceController = TextEditingController();
  File? image;

  final ImagePicker picker = ImagePicker();
  bool isLoading = false;

  // String? selectedcategory;
  String? selectedcategory = 'Electronics';
  var categories = [
    'Electronics',
    'fashion',
    'Home appliances',
    'sports',
  ];

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  Future<void> submitProduct() async {
    if (image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Image is required')),
      );
      return;
    }

    if (productnameController.text.trim().isEmpty ||
        productdescriptionController.text.trim().isEmpty ||
        productpriceController.text.trim().isEmpty ||
        selectedcategory == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('All fields are required')),
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      String imageUrl = await ProductService().addproductimage(image!);

      ProductModel newProduct = ProductModel(
          prodname: productnameController.text.trim(),
          prodescription: productdescriptionController.text.trim(),
          proprice: int.tryParse(productpriceController.text.trim()),
          proimage: imageUrl,
          category: selectedcategory);

      await ProductService().addproduct(newProduct);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product added successfully')),
      );

      // Clear the fields after submission
      productnameController.clear();
      productdescriptionController.clear();
      productpriceController.clear();
      setState(() {
        image = null;
        selectedcategory = 'Electronics';
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              child: image == null
                  ? const Text('No image selected')
                  : Image.file(image!),
            ),
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pick image'),
            ),
            TextField(
              controller: productnameController,
              decoration: InputDecoration(
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: productdescriptionController,
              decoration: InputDecoration(
                hintText: 'Description',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: productpriceController,
              decoration: InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            DropdownButton<String>(
              value: selectedcategory,
              onChanged: (String? newvalue) {
                setState(() {
                  selectedcategory = newvalue;
                });
              },
              items: categories.map((String category) {
                return DropdownMenuItem(
                  value: category,
                  child: Text(category),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: submitProduct,
                    child: const Text('Submit'),
                  ),
          ],
        ),
      ),
    );
  }
}
