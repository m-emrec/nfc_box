import 'package:firebase_auth/firebase_auth.dart';
import 'package:nfc_box/logger.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/resources/firebase_utils.dart';
import '../model/credentials.dart';

import 'google_sign_in_service.dart';

class AuthService extends FirebaseUtils {
  Future<DataState> signUpWithEmail({
    required Credentials credentials,
  }) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: credentials.email, password: credentials.password);
      return DataSuccess(null);
    } catch (e) {
      return DataFailed(
        AppErrorText.errorMessageConverter(
          e.toString(),
        ),
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
      logger.e(e);
      return DataFailed(e);
    }
  }
}
