import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sunofthebeach_shop/model/product_model.dart';
import 'package:sunofthebeach_shop/model/user_model.dart';

class DatabaseService {
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;

  Future<void> createUserFromModel({required User user}) async {
    final docUser = _firebaseStore.collection('users').doc(user.uid);
    final Map<String, dynamic> userInfo = user.toMap();
    await docUser.set(userInfo);
  }

  Future<User?> getUserFromUid({required uid}) async {
    final docUser = _firebaseStore.collection('users').doc(uid);
    final snapshot = await docUser.get();

    if (!snapshot.exists) return null;

    final userInfo = snapshot.data();
    final user = User.fromMap(userMap: userInfo!);
    return user;
  }

  Future<void> updateUserFromUid({required uid, required User user}) async {
    final docUser = _firebaseStore.collection('users').doc(uid);
    final newUserInfo = user.toMap();

    docUser.set(newUserInfo);
  }

  Future<List<Product?>> getFutureListProduct() async {
    final snapshot = await _firebaseStore.collection('products').get();

    return snapshot.docs
        .map((doc) => Product.fromMap(productMap: doc.data()))
        .toList();
  }

  Stream<List<Product>> getStreamListProduct() => _firebaseStore
      .collection('products')
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Product.fromMap(productMap: doc.data()))
          .toList());

  Future<void> addProduct({required product}) async {
    final docProduct = _firebaseStore.collection('products').doc();

    final Map<String, dynamic> productInfo = product.toMap();

    await docProduct.set(productInfo);
  }
}
