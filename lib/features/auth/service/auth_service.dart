import 'package:firebase_auth/firebase_auth.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/resources/firebase_utils.dart';
import '../model/credentials.dart';

import 'google_sign_in_service.dart';

class AuthService with FirebaseUtils {
  Future<DataState> signUpWithEmail({
    required Credentials credentials,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(
        e,
      );
    }
  }

  Future<DataState> signInWithEmail({
    required Credentials credentials,
  }) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(
        e,
      );
    }
  }

  Future<DataState> forgotPassword({
    required Credentials credentials,
  }) async {
    try {
      await auth.sendPasswordResetEmail(
        email: credentials.email,
      );
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e.code);
    } catch (e) {
      return DataFailed(e);
    }
  }

  Future<DataState> signInWithGoogle() async {
    try {
      final OAuthCredential credential = await GoogleSignInService().signIn();
      await auth.signInWithCredential(credential);
      return DataSuccess(null);
    } on FirebaseAuthException catch (e) {
      return DataFailed(e);
    } catch (e) {
      return DataFailed(e);
    }
  }
}
