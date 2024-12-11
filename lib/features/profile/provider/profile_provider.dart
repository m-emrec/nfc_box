import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nfc_box/features/profile/view%20model/profile_view_model.dart';
import 'package:nfc_box/features/profile/service/profile_firebase_service.dart';

class ProfileProvider {
  static final profileFirebaseServiceProvider =
      Provider<ProfileFirebaseService>((ref) {
    return ProfileFirebaseService();
  });

  static final profileViewModelProvider =
      ChangeNotifierProvider<ProfileViewModel>((ref) {
    return ProfileViewModel(
      profileFirebaseService: ref.read(profileFirebaseServiceProvider),
    );
  });

  static Future<void> deleteAccount(WidgetRef ref) =>
      ref.read(ProfileProvider.profileViewModelProvider).deleteAccount();
  static Future<void> removeItems(WidgetRef ref) =>
      ref.read(ProfileProvider.profileViewModelProvider).removeItems();
  static Future<void> changePassword(WidgetRef ref, String newPassword) => ref
      .read(ProfileProvider.profileViewModelProvider)
      .changePassword(newPassword);
}
