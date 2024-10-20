import 'package:flutter/foundation.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import 'package:nfc_box/core/resources/error_manager.dart';
import 'package:nfc_box/core/utils/widgets/custom_toast.dart';
import 'package:nfc_box/features/auth/model/credentials.dart';
import 'package:nfc_box/features/auth/service/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService;

  AuthViewModel({required AuthService authService})
      : _authService = authService;

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
        () => _authService.forgotPassword(credentials: credentials));
  }

  _handleDataState(Function func, {String? msg}) async {
    final DataState _dataState = await func();

    if (_dataState is DataSuccess && msg != null) {
      Toast.succToast(title: msg);
    } else {
      Toast.errToast(
        title: AppErrorText.errorMessageConverter(
          _dataState.exception.toString(),
        ),
      );
    }
  }
}
