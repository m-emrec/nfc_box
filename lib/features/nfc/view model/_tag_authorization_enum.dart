part of 'nfc_view_model.dart';

/// This enum is used to check the authorization type of the tag.
enum _TagAuthorization {
  /// This tag is authorized to the user.
  /// So user can read or write this tag.
  authorized,

  /// This tag is not authorized to the user.
  /// So user can't read or write this tag.
  unauthorized,

  /// This tag has no authorization. It is not assigned to any user.
  /// So this tag is new and can be assigned to the user.
  none,
}
