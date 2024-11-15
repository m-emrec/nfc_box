part of '../view model/nfc_view_model.dart';

/// This enum contains the error messages of the NFC service.
enum _NfcErrors {
  /// This error occurs when the NFC tag is not authorized.
  /// return value is "Unauthorized tag"
  unAuthorized("Unauthorized tag"),

  /// This error occurs when the NFC tag is not available.
  /// return value is "NFC not available."
  unAvailable('NFC not available.'),

  /// This error occurs when timeout reading NFC.
  /// return value is "Timeout reading NFC"
  timeOut('Timeout reading NFC'),

  /// This error occurs when something went wrong.
  /// return value is "Unknown error"
  unknown('Unknown error'),
  ;

  final String message;
  const _NfcErrors(this.message);
}
