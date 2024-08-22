import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerceapp/model/auth_model.dart';

class UserService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<AuthModel?> getCurrentUser(String userId) async {
    try {
      DocumentSnapshot doc =
          await firestore.collection('users').doc(userId).get();
      return AuthModel.fromjson(doc.data() as Map<String, dynamic>);
    } catch (e) {
      throw Exception('failed to get data');
    }
  }
}
