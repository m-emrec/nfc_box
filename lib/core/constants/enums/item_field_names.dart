// ignore_for_file: constant_identifier_names

import 'package:easy_localization/easy_localization.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

/// This enum contains the name of the fields which user can add.
///
/// If there is a need to add a new field to teh app in the future , update this.
enum ItemFieldNames {
  Color,
  Text,
  Date,
  ;
}

extension ItemFieldNamesExtension on ItemFieldNames {
  /// Returns the name of the field.
  String get name {
    switch (this) {
      case ItemFieldNames.Color:
        return tr(LocaleKeys.itemFieldNames_color);
      case ItemFieldNames.Text:
        return tr(LocaleKeys.itemFieldNames_text);
      case ItemFieldNames.Date:
        return tr(LocaleKeys.itemFieldNames_date);
    }
  }
}
