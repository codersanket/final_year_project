import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class StorgaeConstants {
  static FirebaseFirestore get _firestore => FirebaseFirestore.instance;

  CollectionReference productsStorage = _firestore.collection("Products");
  CollectionReference users = _firestore.collection("Users");
}
