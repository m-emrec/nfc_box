import 'package:flutter/material.dart';

/// Uygulamada kullanıcının karşılacabileceği hataları, kullanıcınının
/// anlayabileceği şekilde ona göstermek için `AppErrorText` class'ını kullanıyoruz.
abstract class AppErrorText {
  AppErrorText();

  /// **Yapı**
  ///```
  ///{
  /// hata kodu : Kullanınının anlayabileceği hata mesajı.
  /// }
  /// ```
  static final Map _errorText = {
    //Firebase Auth
    "The email address is already in use by another account.":
        "The email address is already in use by another account.Try to login.",
    "The email address is badly formatted.":
        "Please provide a valid email address. Ex:}\nxxx@xx.com",
    "INVALID_LOGIN_CREDENTIALS": "Please check your email or password.",
    "invalid-api-key": "The provided API key is invalid.",
    "user-disabled": "The user account has been disabled by an administrator.",
    "user-not-found":
        "There is no user record corresponding to this identifier.",
    "wrong-password": "The password is invalid for the given email.",
    "email-already-in-use":
        "The email address is already in use by another account.",
    "invalid-email": "The email address is not valid.",
    "operation-not-allowed":
        "This operation is not allowed. Contact your administrator.",
    "weak-password": "The password must be at least 6 characters long.",
    "provider-already-linked": "This provider is already linked to the user.",
    "credential-already-in-use":
        "This credential is already associated with a different user account.",
    "requires-recent-login":
        "This operation is sensitive and requires recent authentication. Log in again before retrying.",
    "user-mismatch":
        "The supplied credentials do not correspond to the previously signed in user.",
    "provider-not-found":
        "No supported provider was found to authenticate the user.",
    "invalid-verification-code": "The verification code is invalid.",
    "invalid-verification-id": "The verification ID is invalid.",
    "captcha-check-failed":
        "The reCAPTCHA response token provided is either invalid, expired, or already used.",
    "app-not-authorized":
        "The app is not authorized to use Firebase Authentication with the provided API key.",
    "expired-action-code": "The action code has expired.",
    "invalid-action-code":
        "The action code is invalid. This can happen if the code is malformed or has already been used.",
    "invalid-continue-uri":
        "The continue URL provided in the request is invalid.",
    "missing-continue-uri": "A continue URL must be provided in the request.",
    "internal-error": "An internal error has occurred. Please try again later.",
    "invalid-tenant-id": "The Auth instance's tenant ID is invalid.",
    "tenant-id-mismatch":
        "The provided tenant ID does not match the Auth instance's tenant ID.",
    "unsupported-tenant-operation":
        "This operation is not supported in a multi-tenant context.",
    "quota-exceeded":
        "The operation could not be completed due to resource limits. Contact Firebase support for assistance.",
    "tenant-not-found": "No tenant for the given identifier was found.",
    "code-expired":
        "The SMS code has expired. Please resend the verification code to try again.",
    "user-token-expired":
        "The user's token has expired, and they must sign in again.",
    "provider-data-not-found":
        "No user record is found for the given provider ID.",
    "invalid-uid": "The provided UID is not valid.",
    // Firebase Firestore
    "permission-denied":
        "The operation was denied due to insufficient permissions.",
    "unauthenticated": "The operation requires authentication.",
    "not-found": "The requested document or resource was not found.",
    "already-exists":
        "The document or resource already exists and cannot be overwritten.",
    "resource-exhausted":
        "Quota exceeded or rate limited. Contact Firebase support for assistance.",
    "invalid-argument": "The provided argument is not valid.",
    "deadline-exceeded": "The operation timed out and was not completed.",
    "aborted":
        "The operation was aborted, typically due to a concurrency issue.",
    "out-of-range": "The provided value is outside the allowed range.",
    "unimplemented": "The operation is not implemented or not supported yet.",
    "internal": "An internal error has occurred. Please try again later.",
    "unavailable":
        "The service is currently unavailable. Please try again later.",
    "data-loss": "Unrecoverable data loss or corruption.",
    "cancelled": "The operation was cancelled.",
    "unknown": "An unknown error occurred.",
    // Google Sign in
    "account-exists-with-different-credential":
        "An account already exists with the same email address but different sign-in credentials. Try signing in with a different method or link the existing account to this authentication provider.",
    "invalid-credential":
        "The supplied credential is invalid or has expired. Please sign in again.",
    "popup-closed-by-user":
        "The Google Sign-In popup was closed by the user before completing the sign-in process.",
    "popup-blocked":
        "The browser blocked the Google Sign-In popup. Ensure that popups are not blocked in your browser settings.",
    "invalid-client-id":
        "The provided Google API client ID is invalid or does not match the configured OAuth 2.0 client IDs.",
    "network-request-failed":
        "A network error occurred during the Google Sign-In process. Check your internet connection and try again.",
    "no-such-provider":
        "No authentication provider found for the given ID. Make sure Google Sign-In is enabled in your Firebase project.",
    "token-expired":
        "The Google Sign-In token has expired. Please sign in again.",
    "user-cancelled": "The user cancelled the Google Sign-In process.",
    "web-storage-unsupported":
        "Web storage is not supported in the current browser. Ensure that localStorage and sessionStorage are supported.",
    "invalid-user-token":
        "The user's token is invalid, and they must sign in again.",
    "custom-token-mismatch":
        "The custom token corresponds to a different audience.",
    "dynamic-link-not-activated":
        "The provided dynamic link domain is not activated for Firebase Dynamic Links. Activate it in the Firebase console.",
    "dynamic-link-not-match-config":
        "The provided dynamic link domain does not match the configured domain in the Firebase console."
  };

  /// Bu fonksiyon parametre olarak bir error-code alır.
  /// Ve bu error-code'u kullanıcıya anlayabileceği şekilde gösterir.
  ///
  /// **Kullanım Şekli :**
  /// ```
  /// try {
  /// data = someMethod();
  /// }catch(errorCode){
  ///  print(AppErrorText.errorMessageConverter(errorCode))
  /// }
  ///```
  static String errorMessageConverter(String? errorCode) {
    late String message;

    /// Eğer errorCode String değilse önce bunu String'e çevirmeye çalış.
    /// Olmazsa "Unknown error! Please try again." döndür.
    if (errorCode.runtimeType != String) {
      try {
        errorCode = errorCode.toString();
      } catch (e) {
        message = "Unknown error! Please try again.";
        return message;
      }
    }

    /// For debug purposes
    /// Burası debug yapmayı kolaylaştırmak için.
    /// Uygulama release aşamasına geldiğinde burası silinecek.
    if (_errorText[errorCode] == null) {
      debugPrint("---UNHANDLED ERROR CODE--- \n${errorCode!}");
    }

    /// [_errorText] içerisinde verilen errorCode'u ara.
    /// Eğer _errorText içeirsinde böyle bir hata kodu yok ise
    /// "Unknown error! Please try again." döndür.
    message = _errorText[errorCode] ?? "Unknown error! Please try again.";
    return message;
  }
}
