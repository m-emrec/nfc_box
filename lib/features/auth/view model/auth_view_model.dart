import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/logger.dart';
import '../../../core/resources/data_state.dart';
import '../../../core/resources/error_manager.dart';
import '../../../core/utils/widgets/custom_toast.dart';
import '../model/credentials.dart';
import '../service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel({required AuthService authService})
      : _authService = authService;
  bool? isLoading;
  Future<void> signInWithEmail(Credentials credentials) async {
    await _handleDataState(
        () => _authService.signInWithEmail(credentials: credentials),
        msg: "Successfully Signed In");
  }

  Future<void> signUpWithEmail(Credentials credentials) async {
    await _handleDataState(
        () => _authService.signUpWithEmail(credentials: credentials),
        msg: "Welcome to Nfc Box");
  }

  Future<void> googleSignIn() async {
    await _handleDataState(() => _authService.signInWithGoogle(),
        msg: "Successfully Signed In");
  }

  Future<void> forgotPassword(Credentials credentials) async {
    await _handleDataState(
        () => _authService.forgotPassword(credentials: credentials),
        msg: "Password reset email sent.\nPlease check your email address");
  }

  _handleDataState(Function func, {String? msg}) async {
    final DataState dataState = await func();

    if (dataState is DataSuccess && msg != null) {
      Toast.succToast(title: msg);
    }
    if (dataState is DataFailed) {
      Toast.errToast(
        title: AppErrorText.errorMessageConverter(
          dataState.exception.toString(),
        ),
      );
    }
  }
}
