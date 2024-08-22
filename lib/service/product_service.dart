import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/product_model.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ProductService {
  final String imagename = DateTime.now().microsecondsSinceEpoch.toString();
  final Reference firebasestorage = FirebaseStorage.instance.ref();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  late final CollectionReference<ProductModel> postimgref =
      firestore.collection('products').withConverter<ProductModel>(
            fromFirestore: (snapshot, options) =>
                ProductModel.fromJson(snapshot.data() ?? {}),
            toFirestore: (value, options) => value.tojson(),
          );

  Future<String> addproductimage(File image) async {
    final Reference imagefolder = firebasestorage.child('images');
    final Reference uploadedImage = imagefolder.child("$imagename.jpg");

    try {
      await uploadedImage.putFile(image);
      return await uploadedImage.getDownloadURL();
    } catch (e) {
      throw Exception('Failed to upload image: $e');
    }
  }

  Future<void> addproduct(ProductModel model) async {
    await postimgref.add(model);
  }
}
