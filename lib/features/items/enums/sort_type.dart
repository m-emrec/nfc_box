import 'package:easy_localization/easy_localization.dart';
import 'package:nfc_box/config/localization/lang/locale_keys.g.dart';

/// Enum for sort type
enum SortType {
  date,
  name,
  fieldCount,
  ;
}

extension SortTypeExtension on SortType {
  String get label {
    switch (this) {
      case SortType.date:
        return tr(LocaleKeys.item_sortTypes_date);
      case SortType.name:
        return tr(LocaleKeys.item_sortTypes_name);
      case SortType.fieldCount:
        return tr(LocaleKeys.item_sortTypes_fieldCount);
    }
  }
}
