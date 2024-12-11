import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:nfc_box/core/resources/data_state.dart';
import 'package:nfc_box/core/resources/error_manager.dart';
import 'package:nfc_box/core/utils/widgets/custom_toast.dart';
import 'package:nfc_box/features/profile/service/profile_firebase_service.dart';

import '../../../config/localization/lang/locale_keys.g.dart';

class ProfileViewModel extends ChangeNotifier {
  final ProfileFirebaseService _profileFirebaseService;

  ProfileViewModel({required ProfileFirebaseService profileFirebaseService})
      : _profileFirebaseService = profileFirebaseService;

  Future<void> changePassword(String password) async {
    final dataState = await _profileFirebaseService.changePassword(password);
    if (dataState is DataSuccess) {
      Toast.succToast(desc: tr(LocaleKeys.profile_passwordChanged));
    } else {
      Toast.errToast(
          desc: AppErrorText.errorMessageConverter(dataState.exception));
    }
  }

  Future<void> deleteAccount() async {
    final dataState = await _profileFirebaseService.deleteAccount();
    if (dataState is DataSuccess) {
    } else {
      Toast.errToast(
          desc: AppErrorText.errorMessageConverter(dataState.exception));
    }
  }

  Future<void> removeItems() async {
    final dataState = await _profileFirebaseService.removeItems();
    if (dataState is DataSuccess) {
      Toast.succToast(desc: tr(LocaleKeys.profile_itemsRemoved));
    } else {
      Toast.errToast(
          desc: AppErrorText.errorMessageConverter(dataState.exception));
    }
  }
}
