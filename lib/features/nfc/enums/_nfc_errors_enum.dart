part of '../view model/nfc_view_model.dart';

/// This enum contains the error messages of the NFC service.
enum _NfcErrors {
  /// This error occurs when the NFC tag is not authorized.
  /// return value is "Unauthorized tag"
  unAuthorized,

  /// This error occurs when the NFC tag is not available.
  /// return value is "NFC not available."
  unAvailable,

  /// This error occurs when timeout reading NFC.
  /// return value is "Timeout reading NFC"
  timeOut,

  /// This error occurs when something went wrong.
  /// return value is "Unknown error"
  unknown,
  ;
}

extension _NfcErrorsExtension on _NfcErrors {
  String get message {
    switch (this) {
      case _NfcErrors.unAuthorized:
        return tr(LocaleKeys.nfc_errors_unAuthorized); // Localized key
      case _NfcErrors.unAvailable:
        return tr(LocaleKeys.nfc_errors_unAvailable); // Localized key
      case _NfcErrors.timeOut:
        return tr(LocaleKeys.nfc_errors_timeOut); // Localized key
      case _NfcErrors.unknown:
        return tr(LocaleKeys.nfc_errors_unknown); // Localized key
    }
  }
}
