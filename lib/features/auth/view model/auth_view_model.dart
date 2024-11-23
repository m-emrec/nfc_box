import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';
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
        msg: tr(LocaleKeys.signin_successfullySignedIn));
  }

  Future<void> signUpWithEmail(Credentials credentials) async {
    await _handleDataState(
        () => _authService.signUpWithEmail(credentials: credentials),
        msg: tr(LocaleKeys.signup_welcomeNfcBox));
  }

  Future<void> googleSignIn() async {
    await _handleDataState(() => _authService.signInWithGoogle(),
        msg: tr(LocaleKeys.signin_successfullySignedIn));
  }

  Future<void> forgotPassword(Credentials credentials) async {
    await _handleDataState(
        () => _authService.forgotPassword(credentials: credentials),
        msg: tr(LocaleKeys.forgotPassword_sendResetLink));
  }

  Future<void> _handleDataState(Function func, {String? msg}) async {
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
