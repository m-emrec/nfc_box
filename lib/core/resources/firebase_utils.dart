import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FirebaseUtils {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  // static GoogleSignIn googleSignIn = GoogleSignIn();

  User? get currentUser => auth.currentUser;

  /// Auth state changes stream
  Stream<User?> get authStateChanges => auth.authStateChanges();

  /// UID of current user
  String? get uid => auth.currentUser?.uid;

  Future<DocumentReference<Map<String, dynamic>>> getUserDoc() async {
    return firestore.collection(DatabaseKeys.Users.name).doc(uid);
  }
}

///
/// This enum contains keys which used in Database.
enum DatabaseKeys {
  /// key to receive jointIndex
  Users,
  Items,
}
