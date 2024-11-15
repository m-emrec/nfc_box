import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import '../constants/enums/collection_keys.dart';

mixin FirebaseUtils {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final DatabaseReference rtd = FirebaseDatabase.instance.ref();
  User? get currentUser => auth.currentUser;

  /// Auth state changes stream
  Stream<User?> get authStateChanges => auth.authStateChanges();

  /// UID of current user
  String? get uid => auth.currentUser?.uid;

  /// Use this method to get the user document reference
  Future<DocumentReference<Map<String, dynamic>>> getUserDoc() async {
    return firestore.collection(CollectionNames.Users.name).doc(uid);
  }

  Future<void> signOut() async => await FirebaseAuth.instance.signOut();
}
