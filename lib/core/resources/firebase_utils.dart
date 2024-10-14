import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class FirebaseUtils {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  // static GoogleSignIn googleSignIn = GoogleSignIn();

  User? get currentUser => auth.currentUser;

  /// Auth state changes stream
  Stream<User?> get authStateChanges => auth.authStateChanges();

  /// UID of current user
  String? get uid => auth.currentUser?.uid;
}

///
/// This enum contains keys which used in Database.
enum DatabaseKeys {
  /// key to receive jointIndex
  jointName,

  /// key to receive angle.
  angle,

  /// This key used to reach [joints] map.
  joints,
}
